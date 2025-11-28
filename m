Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C8D3054FE
	for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 10:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764325404; cv=none; b=XxjXFtROCEleYBSdnJcOxTCXj81o1dXNUZUZ55G9PgtRYRJ3YA5OtPaas5EM11LRECx314zuUPEhssclCoMHCocEUW06FGQFaSx4lP9+KEgJ36k4fKzwdEjEcAf2tmEam3vJdvVecK7aB+CBE/vA2HojAv2VC7fd1bqWjHmLwSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764325404; c=relaxed/simple;
	bh=TaRZM71/5VBjSq639Phe6Hwz5f1btLjNNYEyAwc/qwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I6+qbOsowxmLPGfdTvcSyRWCyUgSF579jvcRGkOxGWX06oX7GyMjjVPB0CKYxBGUsUHwokD0d7ZMSDZwl1B/raor5arhFD/fvIRaGEcmarFvIRApnTSzB0lGrxUbsQ59FMNCgD+AUiOaGVQD0xzWsONvzGS7SQBBf5S7zb/inL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwS04ke5; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwS04ke5"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b728a43e410so297395866b.1
        for <linux-sound@vger.kernel.org>; Fri, 28 Nov 2025 02:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764325400; x=1764930200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2uX5AKFlE3KaTGTC6lsIDfjTJSY5MRYErJSJUEI7kZs=;
        b=lwS04ke52Lde+sXEi9oGBe20Cn4j96HjaYeymHEWKBQwcyeIdOvomTx5yBrI1WGnxe
         bX7+p1OVcpfWe9q4R5fnON5OT+OtjmqvCU4jNYCoctKmSf2E9Ul5eP5mMIDtYBZYAzWj
         XUaG0FdHvot/uyfF1OkMAzpH9+XVac5s6NmSccyJY0RqRSVzDpfcz4jlIrwCcjva08+T
         yWB0byd960KWhFrEFluvBjhHn4yRgodp3GZsEyi+Jmx6em/zvbzBTpg/voh4pY1fO/fe
         szykz9WO+t4dYAWCn5Pg5amHJFqVYAeRjX5fRQmNbj4VR7JC1yjaU679ZfbK/4tTZhzs
         WGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764325400; x=1764930200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2uX5AKFlE3KaTGTC6lsIDfjTJSY5MRYErJSJUEI7kZs=;
        b=AjHRmVoIotN7DicEDqF2W3bs58gP1ntiL9XGQH1GWQZHypWiNco6/nawoAPbAACKUa
         oV832HY2XxcR4KUBVV2SUxechnLzPDNFCep7r6W8RNyi2CQ7rUOYnoXzPQKWrhdqWyu7
         jGQmvsFbGkSeUsom6WCpDB8Botk6Utctg6HQv8P58WIc6LtWW30BUWm5ZRpzNSWl7JFJ
         IWWVPUZWRipwexMJR1VFzonnOvl2lKXeCozUwCRbFxzKe3dqERdlY/3rTlm2NrCv/uvE
         y7c/QBd7+sblmlpMPk6ZyfnLuWJZzuGftJV8vDgE//wbg+mcPuRJNSPAZb5rlKZRMwjC
         pOJA==
X-Forwarded-Encrypted: i=1; AJvYcCU6KFG5mkXWMW1rLYuMoxQUPVkAl3GgWC698ZJLrV2VMc4iKCyaLE7BDTiWJWSgTA/b09Khyv/zvdp7hg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr9FZBwFkc3472G08AsYpKdCMavEUys9nvkxrsbCOFeJ8tEiVZ
	UBSVhx1l2eAEQP/amwn7FeAMsm/AuTtlf2Wu30VLytwYTVn/hQHP+ypd
X-Gm-Gg: ASbGncuHaZYl5EWAny+ujb1T1lPTml3Ucnt/nsqOO8agYzkiGleATQsBeoqTuq/VuKi
	BD93lW6MEHnWgbarkKD2jujAYeuSH0pMvZGCtRqtg/j+P0f6r9TA1DO7XDpfgpY8B6pcJHmgzVG
	4rvPhK9ftGeT9/S61ABRaw3P2uo/F1zVMynF2MMve7HX0gIbDFGLsZjQAQVdF2Tgvor3hwefio/
	OB6OOqJ4x8XW0jFB42NIKuO6TyLyEFche8YVGqdlPmJkwd30+WYLyCDrUTPAnz4lv8/xMXgwVxc
	t9ieeYgi8ZQ60dWjWGH2hlHR/0WY3sWqzVe9KSKpygqKCblL9WwoFRLU91Glg68e8zBpK/M35ca
	FxuVaTQasLhcMTIxeapVy9/3hPAA2cv8jpyLKgTpT0U5KcwiSOZxVt9G4/Z6n81q1EmSGGcasaB
	ysPBb17zn9VIwqQqYRYLSXNUA2ITnK6NrZ5njuQUpvpmLenK6C68KEnxoateKoCHw=
X-Google-Smtp-Source: AGHT+IEGkgK12Pivg49NR/ZOgpbdU3G5UdskYoGlRBNhkhTeK8ns6GTXdVkYN5ONzey9AOU/AvVmTQ==
X-Received: by 2002:a05:6512:10cd:b0:595:80d2:cfdf with SMTP id 2adb3069b0e04-596a3e98385mr9843309e87.6.1764318899877;
        Fri, 28 Nov 2025 00:34:59 -0800 (PST)
Received: from ?IPV6:2001:14ba:437:c00::198? (2001-14ba-437-c00--198.rev.dnainternet.fi. [2001:14ba:437:c00::198])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa48aaasm1029238e87.71.2025.11.28.00.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 00:34:59 -0800 (PST)
Message-ID: <55076f4b-d523-4f8c-8bd4-0645b790737e@gmail.com>
Date: Fri, 28 Nov 2025 10:34:57 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT
 overlays"
To: Rob Herring <robh@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>,
 Saravana Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
 Allan Nielsen <allan.nielsen@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Steen Hegelund <steen.hegelund@microchip.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-2-herve.codina@bootlin.com>
 <f74ab0a2-b74b-4b96-8469-a716c850e230@gmail.com>
 <CAL_JsqJDOYuzutMHMeFAogd5a_OX6Hwi8Gwz1Vy7HpXgNeYKsg@mail.gmail.com>
 <5cf2a12a-7c66-4622-b4a9-14896c6df005@gmail.com>
 <CAL_JsqJjm12LxpDg6LmpY=Ro_keHwnrWiYMLVnG=s_pSP4X2WQ@mail.gmail.com>
 <072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com>
 <CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
Content-Language: en-US
From: Kalle Niemi <kaleposti@gmail.com>
In-Reply-To: <CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/27/25 03:54, Rob Herring wrote:
> On Tue, Nov 25, 2025 at 12:43 AM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
>> On 24/11/2025 19:01, Rob Herring wrote:
>>> On Mon, Nov 24, 2025 at 10:44 AM Kalle Niemi <kaleposti@gmail.com> wrote:
>>>>
>>>> On 11/24/25 16:53, Rob Herring wrote:
>>>>> On Mon, Nov 24, 2025 at 8:48 AM Kalle Niemi <kaleposti@gmail.com> wrote:
>>>>>> On 10/15/25 10:13, Herve Codina wrote:
>>>>>>> From: Saravana Kannan <saravanak@google.com>
>>>>>>>
>>>>>>> This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.
>>>>>>>
>>>>>>> While the commit fixed fw_devlink overlay handling for one case, it
>>>>>>> broke it for another case. So revert it and redo the fix in a separate
>>>>>>> patch.
>>>>>>>
>>>>>>> Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
>>>>>>> Reported-by: Herve Codina <herve.codina@bootlin.com>
>>>>>>> Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/
>>>>>>> Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
>>>>>>> Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
>>>>>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
>>>>>>> Link: https://lore.kernel.org/lkml/20240411235623.1260061-2-saravanak@google.com/
>>>>>>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>>>>>>> Acked-by: Mark Brown <broonie@kernel.org>
>>>>>>> ---
>>>>>>>      drivers/bus/imx-weim.c    | 6 ------
>>>>>>>      drivers/i2c/i2c-core-of.c | 5 -----
>>>>>>>      drivers/of/dynamic.c      | 1 -
>>>>>>>      drivers/of/platform.c     | 5 -----
>>>>>>>      drivers/spi/spi.c         | 5 -----
>>>>>>>      5 files changed, 22 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
>>>>>>> index 83d623d97f5f..87070155b057 100644
>>>>>>> --- a/drivers/bus/imx-weim.c
>>>>>>> +++ b/drivers/bus/imx-weim.c
>>>>>>> @@ -327,12 +327,6 @@ static int of_weim_notify(struct notifier_block *nb, unsigned long action,
>>>>>>>                                   "Failed to setup timing for '%pOF'\n", rd->dn);
>>>>>>>
>>>>>>>                  if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
>>>>>>> -                     /*
>>>>>>> -                      * Clear the flag before adding the device so that
>>>>>>> -                      * fw_devlink doesn't skip adding consumers to this
>>>>>>> -                      * device.
>>>>>>> -                      */
>>>>>>> -                     rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>>>>>>>                          if (!of_platform_device_create(rd->dn, NULL, &pdev->dev)) {
>>>>>>>                                  dev_err(&pdev->dev,
>>>>>>>                                          "Failed to create child device '%pOF'\n",
>>>>>>> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
>>>>>>> index eb7fb202355f..30b48a428c0b 100644
>>>>>>> --- a/drivers/i2c/i2c-core-of.c
>>>>>>> +++ b/drivers/i2c/i2c-core-of.c
>>>>>>> @@ -176,11 +176,6 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
>>>>>>>                          return NOTIFY_OK;
>>>>>>>                  }
>>>>>>>
>>>>>>> -             /*
>>>>>>> -              * Clear the flag before adding the device so that fw_devlink
>>>>>>> -              * doesn't skip adding consumers to this device.
>>>>>>> -              */
>>>>>>> -             rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>>>>>>>                  client = of_i2c_register_device(adap, rd->dn);
>>>>>>>                  if (IS_ERR(client)) {
>>>>>>>                          dev_err(&adap->dev, "failed to create client for '%pOF'\n",
>>>>>>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>>>>>>> index 2eaaddcb0ec4..b5be7484fb36 100644
>>>>>>> --- a/drivers/of/dynamic.c
>>>>>>> +++ b/drivers/of/dynamic.c
>>>>>>> @@ -225,7 +225,6 @@ static void __of_attach_node(struct device_node *np)
>>>>>>>          np->sibling = np->parent->child;
>>>>>>>          np->parent->child = np;
>>>>>>>          of_node_clear_flag(np, OF_DETACHED);
>>>>>>> -     np->fwnode.flags |= FWNODE_FLAG_NOT_DEVICE;
>>>>>>>
>>>>>>>          raw_spin_unlock_irqrestore(&devtree_lock, flags);
>>>>>>>
>>>>>>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>>>>>>> index f77cb19973a5..ef9445ba168b 100644
>>>>>>> --- a/drivers/of/platform.c
>>>>>>> +++ b/drivers/of/platform.c
>>>>>>> @@ -739,11 +739,6 @@ static int of_platform_notify(struct notifier_block *nb,
>>>>>>>                  if (of_node_check_flag(rd->dn, OF_POPULATED))
>>>>>>>                          return NOTIFY_OK;
>>>>>>>
>>>>>>> -             /*
>>>>>>> -              * Clear the flag before adding the device so that fw_devlink
>>>>>>> -              * doesn't skip adding consumers to this device.
>>>>>>> -              */
>>>>>>> -             rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>>>>>>>                  /* pdev_parent may be NULL when no bus platform device */
>>>>>>>                  pdev_parent = of_find_device_by_node(parent);
>>>>>>>                  pdev = of_platform_device_create(rd->dn, NULL,
>>>>>>> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
>>>>>>> index 2e0647a06890..b22944a207c9 100644
>>>>>>> --- a/drivers/spi/spi.c
>>>>>>> +++ b/drivers/spi/spi.c
>>>>>>> @@ -4791,11 +4791,6 @@ static int of_spi_notify(struct notifier_block *nb, unsigned long action,
>>>>>>>                          return NOTIFY_OK;
>>>>>>>                  }
>>>>>>>
>>>>>>> -             /*
>>>>>>> -              * Clear the flag before adding the device so that fw_devlink
>>>>>>> -              * doesn't skip adding consumers to this device.
>>>>>>> -              */
>>>>>>> -             rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>>>>>>>                  spi = of_register_spi_device(ctlr, rd->dn);
>>>>>>>                  put_device(&ctlr->dev);
>>>>>>>
>>>>>> Sorry, some of you will receive this message now for second time. First
>>>>>> message was sent to older series of patches.
>>>>>> -
>>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> Test system testing drivers for ROHM ICs bisected this commit to cause
>>>>>> BD71847 drivers probe to not be called.
>>>>> This driver (and overlay support) is in linux-next or something out of
>>>>> tree on top of linux-next?
>>>>>
>>>>> Rob
>>>> Yes the driver is in mainline linux: /drivers/mfd/rohm-bd718x7.c
>>> I don't see any support to apply overlays in that driver.
>> Ah. Sorry for the confusion peeps. I asked Kalle to report this without
>> proper consideration. 100% my bad.
>>
>> While the bd718x7 drive indeed is mainline (and tested), the actual
>> 'glue-code' doing the overlay is part of the downstream test
>> infrastructure. So yes, this is not a bug in upstream kernel - this
>> falls in the category of an upstream change causing downstream things to
>> break. So, feel free to say: "Go fix your code" :)
>>
>> Now that this is sorted, if someone is still interested in helping us to
>> get our upstream drivers tested - the downstream piece is just taking
>> the compiled device-tree overlay at runtime (via bin-attribute file),
>> and applying it using the of_overlay_fdt_apply(). The approach is
>> working for our testing purposes when the device is added to I2C/SPI
>> node which is already enabled. However, in case where we have the I2C
>> disabled, and enable it in the same overlay where we add the new device
>> - then the new device does not get probed.
>>
>> I would be really grateful if someone had a pointer for us.
> Seems to be fw_devlink related. I suppose if you turn it off it works?
> There's info about the dependencies in sysfs or maybe debugfs. I don't
> remember the details, but that should help to tell you why things
> aren't probing.
>
> I've dropped the changes for 6.18 for now. No one really seems to be
> in need of them yet AFAICT.
>
> Rob
Hello,

Thank you for the help. We are going to look into sysfs / debugfs as 
soon as we have time.

I tried with this and result was the same, BD71847 was not probed:
[    0.000000] Kernel command line: console=ttyO0,115200n8 root=/dev/nfs 
rw nfsroot=192.168.255.126:/home/user01/nfs,nfsvers=3 
ip=192.168.255.1:192.168.255.126::255.255.255.0:bbb1:eth0 nfsrootdebug  
fw_devlink=no


With todays linux-next the BD71847 got probed; I assume the changes got 
dropped for the moment.

Kalle

