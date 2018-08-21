From: Ran Shalit <ranshalit@gmail.com>
Date: Tue, 21 Aug 2018 18:16:52 +0000
Subject: Re: ~100 seconds(!) load time of snd-usb-audio
Message-Id: <CAJ2oMhLO6dKpjyB+Ky74HCL=QDvC5uqejGBZ2NHsHZvhnaHqrA@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <CAJ2oMhJ9dxqmum=LAehBu4je7bJDevDPzd4UzijZ5Tp+Y5M8mw@mail.gmail.com>
In-Reply-To: <CAJ2oMhJ9dxqmum=LAehBu4je7bJDevDPzd4UzijZ5Tp+Y5M8mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, Aug 20, 2018 at 8:59 AM Ran Shalit <ranshalit@gmail.com> wrote:
>
> Hello,
>
> We encounter the following strange behavior, and struggle with it for
> couple of days now. I hope someone can suggest how to handle it.
>
> 1. We have a sound card, which takes ~100seconds(!) till it finishes
> loading of snd-usb-audio module.
> please see log here:
> https://pastebin.com/raw/BbNgUvLw
> As you can see the last line " usbcore: registered new interface
> driver snd-usb-audio" is printed ~100 seconds after the card is
> detected.
> 2. Testing other sound cards in same system, shows normal behavior.

A little update, we haven't tested this yet, so it's not correct. We
just saw on similar hw/kernel that there is no issue, but haven't test
it yet on the problematic system.
So this section should be ignored.

> 3. Surprisingly, testing same sound card with another distribution
> (ubuntu) shows no such behavior, and things are immediate.
> 4. We already tried several kernels and see the same behavior in all
> the tested kernels 3.18.11, 4.0.8 , 4.4.98.
> 5. I did find similar issues described here, but no resolve is given:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1537465
>
> I would appreciate any suggestion,

Is there a way to debug the reason for snd-usb-audio waiting time ?

> ranran
