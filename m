From: Bo Shen <voice.shen@atmel.com>
Date: Fri, 19 Jul 2013 06:06:20 +0000
Subject: Re: [alsa-devel] [PATCH] ASoC: atmel: add wm8904 based audio machine driver
Message-Id: <51E8D75C.7030707@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <1374132483-25375-1-git-send-email-voice.shen@atmel.com> <20130718111709.GL22506@sirena.org.uk> <51E8A6EF.4040608@atmel.com>
In-Reply-To: <51E8A6EF.4040608@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: plagnioj@jcrosoft.com, alsa-devel@alsa-project.org, nicolas.ferre@atmel.com, linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org

Hi Mark,

On 07/19/2013 10:39 AM, Bo Shen wrote:
>
>>> +#define MCLK_RATE 32768
>>> +
>>> +static struct clk *mclk;
>>
>> This should be in driver data for the board.  Shouldn't the clock be
>> referenced using the clock bindings?
>
> I will try to implement this in next version.

After check the clock implementation, we are on the way to common clock 
framework, so will do this after we fully transfer to common clock.

Best Regards,
Bo Shen
