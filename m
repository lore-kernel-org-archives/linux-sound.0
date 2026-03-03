Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E306386425
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 20:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772570707; cv=none; b=CEnUZpnazW7eKxC++BO6Oy+8IJNfIJV4JAPvdJUPMSS71B3iwJrF/SAydyui0WTwpFjBJB5p3WB//VK6wUk9SM/8FPcUBzDOq0an9iuBjwyVt4fnliQ2XOnB1AJ4hfivziDWGKiQ3IQNdj54b94sh0LLEO8yXDgnK+mzRcFvLN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772570707; c=relaxed/simple;
	bh=mKQUWbprmoMDf26hed1knwSlse4JrbY3K/duuSFuq10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICa0hLioZKMK04rmVWd1xwkyh3V5teS5T3irOjWVDgCkH4OoeSEbOJSdo9nOaQxXSjnVwAVxZSEmffWZMU95ZImD9SA/Wlt3shp0vd/R6d13wSUuO4b2KKSE+4o4N+rRBpOQbVrtGNBb93lDZy1wMSuufC2AAR6lSiB+I6mWybM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXx4jqRC; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXx4jqRC"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65c01595082so9402716a12.3
        for <linux-sound@vger.kernel.org>; Tue, 03 Mar 2026 12:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772570705; x=1773175505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+n/HsZd2vSM40XBoAX+Qn16Duft1l4bl+vPENifdgbs=;
        b=kXx4jqRC7llhb+CmSFn8W3HXEuWBDOBMHUjlJpJLbDcOEXrPNVcqDHIjLLnT+750Cz
         KYrga78pAa/9daTSjH2sGdRX1pF/YminMfAosTwlie7liXkPaT+SDYeAQ+dn8QpNX80n
         BGBKC4sGrMXxDiCO4LyTBlVKrXVZNY9bla5tja1Rpnl/4YoosUpCHaBERbZSpq8G3kDl
         hiGVsnlkNMijAqKtZArIJ9rHIfvRDUPuBt6jbGBGOen48SEwLXAX34v8VtPi4fusvEqP
         GW4VN9w4a/sm3kxtxP57pTBFyV8h4OGoN90tKgdv70PNXyJQ/K8VabkaXfW71tbmpPlO
         rJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772570705; x=1773175505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+n/HsZd2vSM40XBoAX+Qn16Duft1l4bl+vPENifdgbs=;
        b=kNYqUOhxMeIoUZGCvWPAJmMI86zCaykwVI65lq+lau7nM79AkWYukrNrc0oViG4yVY
         5XaoRof5ufxvfDuWgTNT/TMu9Zj8Eh7BLfyzpGGYlPSDlF6SIX8pbvKOJX45DhAibRlK
         IGCJVYFehaMRfaZe9XIc/86mwVX3GS9MeQaPoaRMiKoDZ8PfebJz34/n9pM1EMNuberr
         ZM8Z+erPGxK05LyTmU6unNJb6OLDP5vV/8RO1Fg070OSne1r2pJHlTtqrw304ifk/1em
         RKeG7zrfppy8ZcR9sihr3/c410XQsnkUqPDkcQcfSv61eIVX4er79Qe+X7jjIPQI4naM
         mJGg==
X-Gm-Message-State: AOJu0Yw1146nZ2kj/btiCdQ6J/Aovaq4Q0u8CSzv3teMIn/bqBcYenYi
	L5ugT+B2zNU2ZiolstVwsUwJ5xNLkHJgQH5xCWtUcOAqXTQG6HOK/P4f
X-Gm-Gg: ATEYQzwCWxyBbwdd1GT42PuWpIsKR0IQNOwjK++Esl9YWIok/Vujd5wWo2WPhVeyIu6
	YIL0cBBRjpTwbKhQxXuffFg0azzdv8Lp+qqEPIA169XPeTPhiYRILNZBAOBWIabE9na36pcL0rS
	Y0uv1Z0h1IqEICBQL7HM+E+UOs9Q4Cx8zsSJhGL2E+tXqBw6kFkfxRWa3ABOk7CRCuTGJzv+kFa
	m8vFgp4wINnogvw5tPicGxYFw/YneUA2AgH2phmFLCB8Bo9G3E/Uyc8aDgyTLaalptXmz6I7vKg
	tDS7+N2qPcjg1o4/CcJJqUHY7AOmUBPTfSxUbE8Z96G3ZTf1+LJprQh0rMQFYhm4nJ5vP/hj1Rx
	3Hw+21ZHaamkHCWv5UXJyDTw8wFjS1rV1uvjmmOToE6gAZ7YeX53OIX+RUshVrg9OsTCKST1cVf
	doXUY9NC2mSJVSQA==
X-Received: by 2002:a05:6402:5205:b0:660:e00f:3225 with SMTP id 4fb4d7f45d1cf-660e00f34abmr234921a12.14.1772570704403;
        Tue, 03 Mar 2026 12:45:04 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660dfa13850sm160317a12.28.2026.03.03.12.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 12:45:03 -0800 (PST)
Date: Tue, 3 Mar 2026 22:45:03 +0200
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hans de Goede <hansg@kernel.org>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 3/3] ASoC: Intel: cht_yogabook: Add driver for Lenovo
 Yoga Book tablets
Message-ID: <aadFe4hBsyTHwV6z@jekhomev>
References: <20260301-asoc-yogabook-v2-v2-0-adcc7ed40985@gmail.com>
 <20260301-asoc-yogabook-v2-v2-3-adcc7ed40985@gmail.com>
 <7932c58b-b6fa-40c3-8967-7710d84f9667@intel.com>
 <aaYRd2Irw8bOpDL0@jekhomev>
 <5ab5d54e-434a-4cef-98fb-c83b8c341407@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ab5d54e-434a-4cef-98fb-c83b8c341407@intel.com>

On Tue, Mar 03, 2026 at 10:30:22AM +0100, Cezary Rojewski wrote:
> On 2026-03-03 1:12 AM, Yauhen Kharuzhy wrote:
> > On Mon, Mar 02, 2026 at 01:03:04PM +0100, Cezary Rojewski wrote:
> > > On 2026-03-01 10:33 PM, Yauhen Kharuzhy wrote:
> > > > Add a new ASoC machine driver for Lenovo Yoga Book Intel Cherry
> > > > Trail-based tablets (YB1-X90F/L, YB1-X91F/L models).
> > > > 
> > > > This platform uses a Realtek ALC5677 codec accompanied by a TS3A227E jack
> > > > configuration detection IC.
> > > > 
> > > > The driver is based on the cht_bsw_rt5672.c mainline driver and the driver
> > > > from the vendor's Android kernel [1].
> > > > 
> > > > There are no other known Cherry Trail platforms using an RT5677 codec, so
> > > > the driver is named 'cht_yogabook', and some device-specific tricks are
> > > > hardcoded, such as jack events and additional GPIOs controlling the
> > > > speaker amplifier.
> > > 
> > > I'd switch to more specific naming. From the Intel-maintainer point of view,
> > > it's easier to navigate between configurations when <platform>-<codec>
> > > naming is in use. TBH, we do not see "yogabook", we configuration composed
> > > of Cherrytrail-based device and rt5677 I2C codec.
> > 
> > So, should it just be named "cht-rt5677", but the code inside will be Yoga
> > Book-specific without generalization? Or is it better to make the code as
> > generic as possible and add machine-specific things via some kind of quirks
> > selected by DMI data, for example? I doubt if we will meet another
> > working Cherry Trail-based device with RT5677 codec in the future.
> 
> "cht_rt5677" sounds like a good filename for this very driver. Yeah, I
> should have used '_' when mentioning <platform>_<codec> in my previous
> response, so that the naming remains cohesive with the vast majority. Oh
> well..

no problem, I am going to follow existing style anyway.

> 
> In regard to the generic/specific - I typically turn to the coverage and the
> schedule to answer such question. I believe the specific tablets you
> mentioned are the only coverage for the driver. And thus I do not see a
> reason to scale beyond that.
> 
> The generic approach is good (and usually favoured) when one provides a
> feature or a driver for specific configuration XYZ_v1 but with XYZ_v2,
> that's coming a year from now, already in mind. I do not think this is the
> case either.

So, it should be enough to rename the driver and keep all
machine-specific things as is until we need to support another
configuration variant (likely never). Sounds good for me.

> > > > +	/* register the soc card */
> > > > +	snd_soc_card_cht_yb.dev = &pdev->dev;
> > > 
> > > I'd move away from static-card approach and dynamically allocate the object
> > > here, in the probe() function.
> > 
> > hmm... OK but why? Most sound drivers use a static approach to simplify
> > declaration.
> 
> Most of the "legacy" machine-board drivers I'd say. If you take a look at
> SOF's or avs's (intel/avs/boards) the number of static cards is limited.
> 
> There is no _strong_ argument against or in favour of either. The reason I
> suggest to switch to the dynamic approach is similar to what you do here -
> base your code on someone else' work. When such copy lands on a
> configuration where not one but two I2C codecs are present, more than one
> sound card might be desired.
> With statics, things would get messy in runtime. With dynamic allocation
> developer can forget about problems related to inheriting some unwanted
> data.

Yes, avoiding of spreading a bad practice is a good reason, even for cases
where we never get more than one card instance, thanks for explanation.

> 
> Small bonus is not occupying space for the card object until the
> platform-device (that represents the sound card) is ready for probing. The
> static descriptor occupies space the moment the module is launched.

sure.


-- 
Yauhen Kharuzhy
