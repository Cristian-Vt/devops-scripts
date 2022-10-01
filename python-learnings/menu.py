from rich import print as rprint
from pick import pick


def main():
    rprint("[bold][purple]AWS cleanup script")
    title = 'Please choose what you want to do: '
    options = ['Remove orphaned CDK asset images', 'Set log group retention policy', "Delete empty log groups", 'Exit']

    option = ""

    while option != "Exit":
        option, index = pick(options, title, indicator='-->', default_index=0)
        if index == 0:
            rprint("[italic red]Hello[/italic red] World!")
        elif index == 1:
            rprint("[bold][purple]AWS cleanup script2")
        elif index == 2:
            rprint("[bold][purple]AWS cleanup script3")
    return 0


if __name__ == '__main__':
    main()