From: Bo Shen <voice.shen@atmel.com>
Date: Tue, 16 Oct 2012 08:59:42 +0000
Subject: Re: [PATCH 2/2] ASoC: atmel-ssc: use module_platform_driver macro
Message-Id: <507D21FE.1050402@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
References: <1350359819-2461-1-git-send-email-voice.shen@atmel.com>
 <1350359819-2461-2-git-send-email-voice.shen@atmel.com>
 <507D15C2.7000606@atmel.com> <20121016084947.GD12801@game.jcrosoft.org>
In-Reply-To: <20121016084947.GD12801@game.jcrosoft.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: alsa-devel@alsa-project.org, broonie@opensource.wolfsonmicro.com, Nicolas Ferre <nicolas.ferre@atmel.com>, Wolfram Sang <w.sang@pengutronix.de>, linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 10/16/2012 16:49, Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 10:07 Tue 16 Oct     , Nicolas Ferre wrote:
>> On 10/16/2012 05:56 AM, Bo Shen :
>>> This patch removes some code duplication by using module_platform_driver
>>>
>>> Signed-off-by: Bo Shen <voice.shen@atmel.com>
>>
>> Very good simplification but...
>>
>>> ---
>>>   drivers/misc/atmel-ssc.c |   18 ++++--------------
>>>   1 file changed, 4 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/misc/atmel-ssc.c b/drivers/misc/atmel-ssc.c
>>> index 23dcb76..ac00f83 100644
>>> --- a/drivers/misc/atmel-ssc.c
>>> +++ b/drivers/misc/atmel-ssc.c
>>> @@ -68,7 +68,7 @@ void ssc_free(struct ssc_device *ssc)
>>>   }
>>>   EXPORT_SYMBOL(ssc_free);
>>>
>>> -static int __init ssc_probe(struct platform_device *pdev)
>>> +static int ssc_probe(struct platform_device *pdev)
>>
>> Here you remove the __init altogether, maybe converting to __devinit is
>> the proper replacement for this? I do not know myself but if anybody knows?
> yes __devinit is mandatory

I will add a small patch to fix this.

Thanks.

BRs,
Bo Shen

>
> Best Regards,
> J.
>

