Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD6A33E36A
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 10:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198513; cv=pass; b=EBgFI7ML2IyRjOq5r9coOoqptMO2JebinUoM0vGc4YwYU67X55fRT6n+SsEyZ7JTXzPaSs4/fxA2aAuEP+/2Tl9KZxu2tO8RKCQBauZY7b8Hc61q1eQsFfKUdRS5SJ9GGAe/MSY+h9XmkXApDNoCck9YfgVubqc4wytlkfBhfJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198513; c=relaxed/simple;
	bh=JP6sOAXLUvLPH7W7EcdkbwSmBSNvmNL/XWPIPeP0OXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LQ5n4OqwpW/1MmezCBdRnAJlCwucR49wu7I86e91yFSxi/9PBAGDEtbw7/GIBxomiTgpxRKJqovdOYDFqfgs46bAVOmSyJGkg4vjvUh0SnFQXvhC/rR/jPENTBAjEDMI2o0Q6ovfqIN3KENd4KRV6JQ/VgNQ3ImnhtcjU5si9XM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbdklFBN; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbdklFBN"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ce9e39fccbso853075ad.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 03:41:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784198512; cv=none;
        d=google.com; s=arc-20260327;
        b=AHuckjBxSMA0U5OVpTK0z3OZR593XrHFTEAwFDMbd8D4Y4oJDh5jh6GqJOtiubQj92
         wdYtsQmPINUGKjp2k0lyr0ghtQnMj+tc6xYf60hxvJqA7Da0OAiBoQa8tR4zBaddbwdF
         Cf8HfltA6vn2ylWqTYvEWYzlJ6h/hEcSMGjJaME1dmAR1A9QGmbR0Fr7hkl69C6CZIAD
         rJkJieX+ttmO/2Hy0ottlg5AjPYMCfauJyHi4UNHzh325kVOPTPfcDAT6y97ie6YbWZV
         rAwz8V83okI3t986vuhYrNbc0QRq1BEmKw0cIKprrzKDe9GTR1QrnjP7fbYq/mWrs1Au
         uStA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eQrzUwZj4GqJ8tiddXXhlzubaZjD3v0tccnIoXXZE1k=;
        fh=fK02+7YxWCakvd5rCYzjgWiJ5HU4ybnoOFf3/oTnTpo=;
        b=UNzqfq/M5h58mC2VRvcH2vvcyAK0aAtqJAuKBpGxn2wfqDu9L8eGCwyp++3yulEfVw
         ZZ7aIU5NwyIoHslqMzfTV8/Xue3gmY7OM5l+VJ4IcrXcK/mWB/hIFKlTA19f3ws2fTKF
         6SOhpXI28XJq1ziedEBlFVASjLtHLJqnMrE1YbgbsSOdApPD5Y/LAswu7w/qIPthLYc7
         Qg2NH6OwURo+8wDB1sH3VPN5NrFq37UiRikKN20rNfvoZfacddck21Bg7rwDjU1BXfG0
         JBKPmRwLe1r1rgPK/jwYHiDV7/q8HuFbPlTqIosiT0uJUrOiwAiFRE7gAGtt2gNJvVeg
         OHfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784198512; x=1784803312; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQrzUwZj4GqJ8tiddXXhlzubaZjD3v0tccnIoXXZE1k=;
        b=cbdklFBNUifx0w2lOF595jpRs5xQGs6+DfCiHP0QARRojLCnd6WnA5iZvANQNLDMn/
         dhBOGQPCAIdNstUcRqnJrIbzFtQVXegzFGjyFoAdlhLdgxzanbOBkpMlf02KwSDTqbfC
         FJg8BYCBN3/FuEjCtz86v0cOfdcN2w/chbvUJ3RkRQ27kJO6uOypEfNfC42swdFtBEYM
         jr5rdHst+R7vBrNxas4ubgFAyAw4P/mtESDIgNPG7XnvCju3kKkUw20R8mXTE7X4bbUZ
         55XetNGmwIckf7jH2XjGY1jGmP0IWPufND41HrAaArSwCgfLw89WEmK3FypaqFaqVM9T
         As9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198512; x=1784803312;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eQrzUwZj4GqJ8tiddXXhlzubaZjD3v0tccnIoXXZE1k=;
        b=BVW5lk0by2yQClYdg3G0uWLh8DYfs2QESbzokrOyAkjuqfiBluuyepuHs3urA8z/wR
         ptPifP9eGi82tf8H0IB6MgcfwHDUGOZbypyi56TfPh0WHILgSQToaLUPkmowkrreRmqU
         FwKpnix9YWJ/TQoaZ6jGleJIQtz0KbmNT0B7ROGs3raMc0ADaVkSnKXn7FIDdUh/S7K7
         7dNbKdtV5ObSe5WYdbez7YOg619nMhZEm1h8YaPED7PH0VZtmffU9cRNri71Dl7OlX67
         Ve1671Ug0y4ukuZ1hrQp7jQOvBVseuKNZPR8/o5HeNwzMZbYCWDj/naAfrOVkUbcCL+S
         FEjw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/wsr6dvDcvOF4KctU5A+ElK09Z1T5GZ5I6Q/mNQMmxYT4D8AW0Cv3zbLhIL5pFVeex0fE1juc+GIEzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YztTqXs5+gNPsgXsc18Iti6yTaMMrfMEY6Fwx/Ud3Da68DVX2Z2
	Yoy2QDwcwiE0D985wboLkjCh74gJ14Mx0dkveOLgPzysqwLkAmZDG7st4yGlEpJczEySjyOboKl
	vJ/oEbdWEJSkw18QeZuo0DOLuw5cC9mw=
X-Gm-Gg: AfdE7ckqGVg23x4srLviLJcIzrTKCRLAi27uo6Knen/vU2+sX2MmOut34FyH6a2bv+5
	/f8Vr8zWK9vNOzz/JsoppDflum4iDZshPa6of68Ba2Un5T6Dlmos5wpGwwfYn5RKieraILqYomf
	ghJ+B+MFoML9d/4E6oMRCBBI+DhafNtfLDodDlsUBWDhkbxb1RDq+xb8BhGgnBm5gk+ESazZQIL
	VKdYVRacxSirjYmF7DGFfj5al9HO6qm96L7yYEy24+/6ebgaQalrxXDgyvyv5SCxJ22Skfab4l6
	lWbxMi9zjfwCjUVe
X-Received: by 2002:a17:903:3c2d:b0:2c9:e846:a589 with SMTP id
 d9443c01a7336-2cf1f486585mr20139935ad.13.1784198511761; Thu, 16 Jul 2026
 03:41:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716090829.72082-1-phucduc.bui@gmail.com> <20260716090829.72082-11-phucduc.bui@gmail.com>
 <3940b68d-da97-4e27-8816-e912162b6f62@intel.com>
In-Reply-To: <3940b68d-da97-4e27-8816-e912162b6f62@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 16 Jul 2026 17:41:40 +0700
X-Gm-Features: AUfX_mzrjRGlLMVZD_1hObbnwLCLnGXTB2JeQoYT0Gfa37WjMSZzbVYfBE1414o
Message-ID: <CAABR9nGtoFmHjUcbhKxwY_-YJ_Kb++OVN8YkZKvkCMgBEHFjjQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] ASoC: ti: rx51: Use dev_err_probe() for error handling
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jarkko Nikula <jarkko.nikula@bitmer.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thanks for the reminder, Cezary.

>
> Pinging this patch too to make it easier, Phuc.  Certainly 7/10 isn't
> the only one.
>

I've fixed the remaining instances and sent the v3 series.

Best regards,
Phuc
