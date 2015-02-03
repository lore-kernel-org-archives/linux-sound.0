From: Manuel Lauss <manuel.lauss@gmail.com>
Date: Tue, 03 Feb 2015 14:40:45 +0000
Subject: Re: [RFC PATCH] ASoC: wm8731: let codec to manage clock by itself
Message-Id: <CAOLZvyEVQmqg9Jn5Kt_2m5K0-taJcGf6mweK4T=fwKOwn-Ovxg@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <1422934415-24957-1-git-send-email-voice.shen@atmel.com>
 <CAOLZvyE6W8-X2_M+-KQNry2VPwLzwbBLuxr5Z5EdBQo7Skv2RQ@mail.gmail.com> <20150203124441.GK21293@sirena.org.uk>
In-Reply-To: <20150203124441.GK21293@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: Bo Shen <voice.shen@atmel.com>, Manuel Lauss <manuel.lauss@googlemail.com>, Liam Girdwood <lrg@slimlogic.co.uk>, Richard Purdie <richard@openedhand.com>, patches@opensource.wolfsonmicro.com, linux-sound@vger.kernel.org, alsa-devel <alsa-devel@alsa-project.org>, linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Feb 3, 2015 at 1:44 PM, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Feb 03, 2015 at 08:54:57AM +0100, Manuel Lauss wrote:
>
>> +    wm8731->mclk = devm_clk_get(&spi->dev, "mclk");
>> +    if (IS_ERR(wm8731->mclk)) {
>> +        wm8731->mclk = NULL;
>> +        dev_warn(&spi->dev, "assuming static MCLK\n");
>> +    }
>
> This is broken for both deferred probe and in the case where the clock
> API genuinely returns a NULL clock.  Other than that it's the kind of
> thing that we've done for some other drivers, though it's not good to
> have to do this.  Check them for correct behaviour.

Hm, so the only option is to create the simples possible 12MHz clk object?

Manuel
