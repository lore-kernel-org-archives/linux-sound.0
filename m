Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8520B1B47BA
	for <linux-sound@vger.kernel.org>; Thu, 20 Jun 2024 19:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718911670; cv=none; b=B/SjMgForHgML5IKHSekToDy0RuvoSU3cDSJu0FHUIkVY56r7ozWkVaE+wI4O5JedwPYfTxnmKvwzuePeuZdrsQf13pJNq+c0WVx7e657+Hgg+jQIVLpiZWjWqIGAN12TS1S54iIDvHSIxN5URWjVbYjCa9uRkWPpdmWTSSuPZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718911670; c=relaxed/simple;
	bh=pdG4nCgSxw/YgFVj+Ej3ol4v6FdjqGrmdWzOvnnEv7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aFx+kre8NNqus+NGIy8A97y1qHCH76IQuYIr7bnnHFGq+fiKkEYaC1umQHTEXEFC4U29oIrZRJeCfxYFOCWGBcuPjOV0BqfS86MP4m+rUDVBFxu6hv/5lAesko3UQUPcPk7/jEkFZVa9oCnpHecQrdoDlKmeTo1NQB7NwrnJdQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k8YSA4ZA; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k8YSA4ZA"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52c7f7fdd24so1560102e87.1
        for <linux-sound@vger.kernel.org>; Thu, 20 Jun 2024 12:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718911667; x=1719516467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdG4nCgSxw/YgFVj+Ej3ol4v6FdjqGrmdWzOvnnEv7s=;
        b=k8YSA4ZAB6x6ni4CIFuUv8oQ4Or9Xdq6Gn9PPdblbkPEjWFGLc/lkeTypoyrj7/4Zb
         nw27Tk091KosjgLmAI2sGEf2tCb+vd08UODUYTIGfommrRzec8Q7TtEB2wW8tVMR12RE
         xC1vOC6k2+4xBDVw2dAaKfnzKSC7gWl3Mskms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718911667; x=1719516467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdG4nCgSxw/YgFVj+Ej3ol4v6FdjqGrmdWzOvnnEv7s=;
        b=CBE23DLTbzfl+vEaKhWDntBQ620XfMN0Y3++am4HAL6qb7OFkIelQJUCtH/fEKJavB
         B2fIpl3TNV60SZCeapUVgJGYbBKS1mX08vIHu8fA4GXNJSSsKf8Mn3CjMjyQkBDCAQUi
         FqrE3a+IyihLzqGM//9B7s192NSGPeBnAvyDvpMKevXFXPKtlpbfPW7zIH/lfiYjhYwu
         /R7EERujRC7WGQ/sm6CxkMrcVxEDfDJOmbrpwVbeGHaW9NrDtZghuPkY8HlkPvFUiW0P
         gOkcZERXZUrhXb6vQK3/5qnKA4PjOPqnPrsn+2jUlHkTHS+pJTHBy4BV2aBrttFpEGgk
         jUzA==
X-Forwarded-Encrypted: i=1; AJvYcCXjjP3/TAgFxB1EpdnSbVFij9lC9AXXxAQ3AHPobfN7PQQy/6iFQG74vdwhdoywm3JO6eAVe102LpUBoIbrj1pVjfmzF36DnHK4v1I=
X-Gm-Message-State: AOJu0YyAyyYr9kzBgUoXmTFM31iulHIzqTB7L/EesCBBPOjvWKIu7/a/
	L0zpEbcAVVHL2D38Vp4SNH439KaysUVZ3X8VBcpewQuRzGB4yqW6ZzRNSp+/A91WZOi37xFkBgX
	J63XmSBkntY4oVWcXNrgwzCaoxn3XM5FCsIWuEnHf97IhpYo=
X-Google-Smtp-Source: AGHT+IFpX4vdPR88vzuw+qOy5LYQoEq2bxuX5ZqXaSLgyv7S8qAFNOakpP03z9BJy6HfhH21zcwde47uzX4pXKbYFYY=
X-Received: by 2002:a05:6512:3043:b0:52c:84d1:1812 with SMTP id
 2adb3069b0e04-52ccaa58704mr4469058e87.7.1718911666694; Thu, 20 Jun 2024
 12:27:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430212838.1.I77b0636d5df17c275042fd66cfa028de8ad43532@changeid>
 <83e218f9-29f5-4f35-bd0c-b298e3bb9e8c@linux.intel.com> <CAEs41JC-vJaMHj6fzmNO=-bu5oURRA-u565sN2=yzBeVtKb=4g@mail.gmail.com>
 <b2375610-4044-49e6-86e9-5c172abb2ffa@linux.intel.com>
In-Reply-To: <b2375610-4044-49e6-86e9-5c172abb2ffa@linux.intel.com>
From: Allen Ballway <ballway@chromium.org>
Date: Thu, 20 Jun 2024 12:27:35 -0700
Message-ID: <CAEs41JAPPr3xRR42H6vKic5rVrtV-on4HyT5wNCXxbJtwijnCA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: intel-dsp-config: Fix Azulle Access 4 quirk detection
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Brady Norander <bradynorander@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	=?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>, 
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
	Mark Hasemeyer <markhas@chromium.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I filed a bug and after sharing the requested information it looks
like this device won't work on SOF without vendor support. Given this,
would the original patch returning this device to using HDAudio be
reasonable, or is there an preferred alternative to force this device
into using HDAudio?

Thanks,
Allen

On Mon, May 6, 2024 at 11:02=E2=80=AFAM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
>
> > Unfortunately the above patch didn't fix the issue, nor did I see any
> > of the change logs in dmesg.
> > Are there other alternative solutions or information I could gather to
> > make a more general solution?
>
> File an issue here: https://github.com/thesofproject/linux/issues
>
> and attach the NHLT table:
>
> sudo cat /sys/firmware/acpi/tables/NHLT > nhtl.dat; gzip nhlt.dat
>
> as well as the results of alsa-info.
