Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAE23C13E0
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 09:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786957248; cv=pass; b=fJHRddMtLESRIqzBjPory/Az2k6DLROxcmkx7b3ccLUVQiRKH5FGwWmArp5sO2+FkBiUgmF/SZwfxPwAkhIs7C7FkltafoQGb9HMno62IiYVCjiLjY7dpQXifSSYK4f91PCRd4tmzLswiP1Uc3OyDF8xJsWsMBz0EmN3XU388Sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786957248; c=relaxed/simple;
	bh=FpAwgs/QpFSSt1pIHMCAJBfHveT/Xputq51sRyavmyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzbNOQ7nv8vi5P3DLjwe8tlKguTZUQRfXwGAfYbvWQBWFjcnY1dLBGFRbUMB+YOfkF0O+8SZLNY/6UgxOj+VG/kstv5vKrYxMzhLYjA+KWLFAhegTOOfR/W6k9swg60IWQyK/elOLv+LgXbrs0qiGYiSp3PzTZfSs651n6ZIP4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2/vdt/1; arc=pass smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2/vdt/1"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bf9466867cso933596e0c.2
        for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 02:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786957246; cv=none;
        d=google.com; s=arc-20260327;
        b=VglX8cxRABUOxUv+ujyHZ5Yi6wFpeMa20/R+gGr3kr0gTMgVoTqt3qZq6vKuZUgJNH
         4H8yEPyy9HFPOsbWswqXJEKxVRZPSRWIXIpHPmIu6SjMCkApgNjuP1ZKs2WPaS9uQMYj
         w7vEJqgqLGrp4sES0kV6mOsPmu1HluhUbrKYUQH+2Xlul3qkoE8IByG2hX+ulvKpuc2z
         G64ApggZf46gNLn/Bj5MYoiAlIWNuA4AW1pNpi3wtOeQOgXKCH+jKDzsRqB9zxr9zmpz
         kWyomMJyWdvi4chSxWlSHKughEeZU0kuYzsyptmYPw9CalUg3nh7QYfDrmtnQHXyJhH+
         Znkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J2pxaM7qVEIl+r9r32/3W/crCxxR2fpkye27iBcvmTs=;
        fh=m71zJhOb7cV/XioqljfgtYSkcgpKQ+m5Bf2hbQNPdWY=;
        b=TbqkXQ7OrJBOdy1f59WTxXpLCua8+d8nU4LdkhvOiK6SUvJK7FqscwZhFORtJrDbng
         5PoHAR9mcsRtchH2utIRy6niP7h33zm5UyRvuZ6fgwHDQGqQ80s5EPTVxlMLBxYvCNzo
         ftewlj0UeJ0V1aMdWaEa6TpE73TOuqUutSXvyn0Egq9JIVSHXdQ3GqKfbs1y+p4btZHv
         fdgdZHUmwUYzakohz/fYwuGRLhDhU7jPrECUHhwOeZe5KaSHBMW0av8DoiKesa8gRd1w
         i861kYdfLIJDMtN+RHDqIXOh0Hve453pBrUIAXhuNvFfWIp+tG54OJHVZsv9ZBW80CYx
         FZSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786957246; x=1787562046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2pxaM7qVEIl+r9r32/3W/crCxxR2fpkye27iBcvmTs=;
        b=F2/vdt/1IJ7SuGuXFf/KOtJ3oZGVt6nM/DCQ5LPPHk56Qtu+XnyYmZxvinXJC9hrl7
         EPfCFHpbg8PMex7rc9dv3DTbylFHpE5aw9x+cGdQX5cKn4arNLpmeC1OUBFO5qteDml5
         1O1Ups1S/Vj0beSPtHdeONVD2oTZgzoHluf2j6ai3iNSJ7PHSteeZRZZTKfkc6FyxtAV
         DR2Uda/2mLN1oJQRzen9r3L9aHS3mjDcHmLm3fJtL8Gj7Bb7HsNASbxRdCL826TUhOuK
         yAxyf6ZkeOUiNJusCMCcBFbqHdEROZY3DTagAzKUpNBzB4Jz24y1ABYKkEeBE42aL8Tk
         8y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957246; x=1787562046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2pxaM7qVEIl+r9r32/3W/crCxxR2fpkye27iBcvmTs=;
        b=HnvM+efAH997uw0yWXCY2pjIuO+8wuk2tiwoBteQh49kCS+p1R5yahZhM1pN3ZyNN2
         o2splEAHoPCEZf2LkSbAWO0KTEoJ0gBcVt3fIMbTqokvXw8C4F0l5yLt8oYdZtHg0vaq
         kPItfwLMW+l8HGEazpUQA0X36RQx41ztTCxPzU2I3w+x40o7wLoKNs15+z3Z52W8HyMA
         zAhgrfqlZJeIiD62b8F2LOeE5s3rlm5fvoXbSdlEZvmGNgC5qwfJRl+FTGLD0kVKulmR
         Y1AW3u3HsDVpOLbMsDVBmgaJUUCNfbA6Lif8ejPowLTA6iZlbah0VHwGnzP9hEqQhcIc
         /Ljw==
X-Forwarded-Encrypted: i=1; AHgh+RpLpsb7WwWFAFUh7U3nBqk8WNFGLuuqHZMt7iICr0AUaFOZQgsp5K2AW6HPxUiEY626VzAcgE5bDw3NYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPCkSTGUus4RSs2AoE3TfwjDCZjk1//u9sQjbEHN187QX3DT21
	N2QvqD+bWelEsF9n/oJema7dfIVOOFt6E/DudmUIek8Gw8qAgs4wqMtIPsJCMZEYl14rLSjLO49
	pxHG2SrlN7gqDDhtLdz5mXNtPKpiMiXO7fe70EKyhmVTd
X-Gm-Gg: AR+sD13nTDOP94l+IIHZM/npVwAXRVlkopl1Uy3MeWwFPgYjqL7xOy9THXe6QZ6mLpp
	FsNj1SGOXFhEqoRD/ZtZcsc1ZouPHtLT4BXGqyTF7LXnDeXZXNbStejtMV32P8UwcetjpO2Oj6B
	DRdFo3TK3z6EETOWn8aswBWf+ppgbzAgdu1Phi70ZUcufTrLRunTJobHrPrwbVaUdwuQrAT+orF
	rCtCo9D2j1WSJ9Imya9NLGUa/kg56I7KFBGA2YrtrXbJ+1pLtbJ++XfeV8wUrKu1dI2yNfkZ5Zq
	OyYNHjG+V+ymHIt7+c3Z7qatuofvURp/q/7R4GUP7e1XEdNfcCJBfYRr67/4+Chl1juA2sHPAqC
	r42/x2w1h3rqIZK9osFaTOtmSb/58zxfdMiacTOywXo8W
X-Received: by 2002:a05:6122:4b84:b0:5c2:c0ae:a2e8 with SMTP id
 71dfb90a1353d-5c591d41c0fmr3570588e0c.7.1786957245806; Mon, 17 Aug 2026
 02:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815182747.8913-1-excursively@gmail.com> <SJ2PR11MB8424EA2C7382EBE3D914FA05FFA72@SJ2PR11MB8424.namprd11.prod.outlook.com>
In-Reply-To: <SJ2PR11MB8424EA2C7382EBE3D914FA05FFA72@SJ2PR11MB8424.namprd11.prod.outlook.com>
From: Sataporn Saijai <excursively@gmail.com>
Date: Mon, 17 Aug 2026 16:00:34 +0700
X-Gm-Features: AcwNN1WLpmR37fQ0T5iywLuwMqry0xEo16-2le8gXg_L0TYeORAUU8tkq2nt08A
Message-ID: <CAHgGaxy-GQJLiXtO2LZkMzVi9ehemyMTj8JbajeokzdRsNTNbQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: add rt721_l3_rt1320_l3
To: "Liao, Bard" <bard.liao@intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Ujfalusi, Peter" <peter.ujfalusi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 11:42=E2=80=AFAM Liao, Bard <bard.liao@intel.com> w=
rote:

> Can you add the SKU to drivers/soundwire/dmi-quirks.c?
> Like 4dab2b904414 ("soundwire: dmi-quirks: Disable ghost Realtek devices =
")

Done. ghost_realtek already has the exact address, so only the DMI match
for 83QM was needed. Tested - the RT722 no longer appears under
/sys/bus/soundwire/devices/. Will send as patch 1/2 in v2.

> Can you check if c8f3c9fa75ff ("ASoC: soc-acpi / SOF: Add best_effort
> flag to get_function_tplg_files op ") is in your kernel?
> In theory, it will skip the BT link and will load other function
> topologies.

It is in my tree (7.2.0-rc7), but best_effort is only ever set from the
topology name:

  topology.c: bool no_fallback =3D strstr(file, "dummy");

With a real sof_tplg_filename it is false, so sof_sdw_get_tplg_files()
returns 0 at SSP2-BT instead of skipping it, and the card fails to probe.
The comment above that line describes 'dummy' as meaning no monolithic
fallback exists, which is the case here - so I think it is the intended
mechanism, though this would be the first machine entry to use it. Happy
to do it differently if you prefer.

Thanks,
Sataporn
