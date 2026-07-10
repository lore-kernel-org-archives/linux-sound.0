Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48B5381AFF
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678837; cv=pass; b=lj8bYasyFced3/zQ/6JOsisQ2KyNUA9KuMYX1zzTloNnJBVJKNeY2EpVlT/+XwQl5htWH+gnMMDqpiQdNak6G9swBXsx0l1wxTJW0qGu2tvnvewFDneBEfLmlDdyH0h9O5HPm/Zooz1S9iwG15nwzWIUgFjKoSnFJLbTH8+iR+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678837; c=relaxed/simple;
	bh=+MWbCokPTStTF6K3o/n9mLY1swhOIwy1qGT/piGGytA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAJg0gFA6JSCMR7mRdgrlPqiNTq2l/x3ZAY792RrVwiz+ZbYZOt1SBynC+uu87xuL7hEjK8qcaViiBCW3OFu9Gc9hWHATh5saJh+DRQayxQvnT3DvvO9jbdF79VZacM7F1p1GFB9RPfDZ5aljNRQpRDkkjfS6jxufOVKf/7HESA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUeJQh7n; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUeJQh7n"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cad4170e8eso8057795ad.3
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 03:20:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783678836; cv=none;
        d=google.com; s=arc-20260327;
        b=WdsW0gXmXnzMGNfA3pHqV4qYbsfj7YKkP8pIdfqBrzYjxgKmODOj/Em9GI9LJBvhNE
         2lQFQgdZ+82ZsAOaovSNcBKoMz/BfBrLkb25Il5IgBcAKgbRUtrVIGItqKdtYyNA2Ikl
         3jHEXKivH/vGI2tcMU7gS+wYfuPRLKdTZjBiNwNJL0ksNuCZTyn5z16krEbtKsfq8Akn
         swjeTCQ3KYexYjIVbgXayinv7o3Ojj3TLXir0wlzUk9xQM0OdWgEfgDvfG13ki1ehtgz
         YzUvZYZ/hjqeyNmXhB3S1vGpeEe68NsVP+AqekfaOXNTPS2CrljHWIHI5w12jRFkZJn9
         XRLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+MWbCokPTStTF6K3o/n9mLY1swhOIwy1qGT/piGGytA=;
        fh=LXNxtNPWRrAZctgTovbljGKVLExsKlA5ck/KlvbULIg=;
        b=i+oQHniF0foZ2xk5skbKhCNtpi+Br8kfXuybLfjTzll7euNk3XtNRMYYGiL33BT/gw
         7Ed1Gm+4LxV3ye3VxHimte+mFmQYU95SvR88tNAtGP7xk62E779xViYQ8e/83Q6MSzma
         74yBpLBq5IFtazMrYu4+mWtebyFW3cQZ2YisQ8lttTaKJ9C/cnpmbQKmMZUKkxfeDzWp
         PIRdHCR3iI4wSd9r2wLYFGPqExcwgK5ozQfrD2ndwqliLRXuGoy9hEZQhwN7JyYG+69B
         LHxlNCaQLaLylHK0u9z9EJK1+x3uiuaiT5SfJCzdi/qRwgoRn54YEFHB2RWtuXBkLM8m
         GnkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783678836; x=1784283636; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MWbCokPTStTF6K3o/n9mLY1swhOIwy1qGT/piGGytA=;
        b=AUeJQh7n8ue5YC9g1QFT/FV9SjZoJR7LLJutT+naC5igZjDdIgd+MOuxCTCVNXxWpJ
         jkvduqMCj7B3PUyxwCjwwPAlfSTykGeKaS4OPhw67NGB9hFjLGE/rjCgeoF16bnfJJJR
         7r2WjryHIELpV7zFbMZgMX8lGWP9JVEQaRaSX+0TZaIGBxQMq/iPqG35HZ38sDgJoB7n
         vtjzaIHmZXcERoBknPrPEW//kvRj2DFsCyOSTi6PBdWEZ0XN3g9Dz/MoyhObVv7o7WhY
         jlg9BkVxHBsvDMTfOoaQib7qL3c12NLlORzekmUXsKWMWVZlfDSKrlD7D6blXZKis9fk
         jxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678836; x=1784283636;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+MWbCokPTStTF6K3o/n9mLY1swhOIwy1qGT/piGGytA=;
        b=iQgxGSqf5PZWqZ2VQHiEC1LgayzbZFqwNKNes2UGLTIrsfAExpxMPTAv7bZYjwDQOQ
         2qK/Wxw3iwbOa7e0CnMOY8xehoCpaAkiUYaA9cmrbQ04JjepKHDEDryrytjtO1PPPYIG
         /QKF7mQEwG3tezaWl4VsvL357jtD1rly0tBhHc8YOOusG1VsqVWfvGWAnPlUzjsm5JB1
         3/7c8eKRyParN5FG/CC9eus+ZpMcGcP+0pTH8OmMVj5JYYa8ffx/jOraPY1Hvc4FiCSb
         5FTrEaCGo+yY5ek0QPXwG40Hab7/HvOJ+eeM6lXuDhHGnrWpehkJhgD35ln1a4JCA0Zu
         95sw==
X-Forwarded-Encrypted: i=1; AHgh+RrEswrwZ2sGmtMx6W0m2NR2t/QsdxVZotOz43ueqGRqzlEovkbJaOeVeSiDwiCBdaOI06BMqu8Jd49u+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXKygc/C70iTaC45PzH4s3lIDWyu7RhEHtkvu149s27WBr3f28
	7uMTQSwdz9RAFXdo3fq0/Mm0Qrt4ggmuOvgovPtF7NvKO1e6IDcsgfailG4EoO5tdCGRabXAMs/
	qdsYY8U1vkKae6hcOilWpDtduMcw+AgU=
X-Gm-Gg: AfdE7cmnNp9V9rx/+ob15bXFkyaxVXeaBbYb35Z9AnDhmPbEhAKmFxjNxtbLfv3wNJf
	Sl1lCJj9J6h0LwmpkuKa+d5znKuaTSEsrUFD0cgoA/W2wTuj7pfeL9UvuGw8pMUOsb2JYpMabX5
	SWsN2LbbDkaiaNaxGAfuYpeA9L8vb5/Hd9NXZJkWc+ExLB6iXrNmKzCGndp6w1JFnKeLI08zNqY
	BFgaH+Ws5SfGDjxKlpqYduklqPwXMwui9QZ3yQNJAh9NH+Xj4+uOf4Hecttt/0jKcu69bJGVr9I
	j1Wk8rh0l7SWW/v4+OpZFO8w13g=
X-Received: by 2002:a17:902:d2c9:b0:2ca:bba:b35c with SMTP id
 d9443c01a7336-2ccea464ea7mr120043665ad.31.1783678836086; Fri, 10 Jul 2026
 03:20:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710050223.14266-1-phucduc.bui@gmail.com> <20260710050223.14266-3-phucduc.bui@gmail.com>
 <a84c3eb1-7ac5-44a8-95cb-e33175e78ee9@amd.com> <CAABR9nFFMMk6i_sjKGjt4t-_QZF_hu2gBPRNK8c-GfhyKdVP8A@mail.gmail.com>
 <da6e74cd-05d7-4ba8-aa75-e186ed8a49cf@amd.com>
In-Reply-To: <da6e74cd-05d7-4ba8-aa75-e186ed8a49cf@amd.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 10 Jul 2026 17:20:24 +0700
X-Gm-Features: AVVi8CdxCM56PJDr2W__GlgaLeg2BqVlA5pLfATLqiG_GVjxauf9_BTAOmIf3Us
Message-ID: <CAABR9nFjjen2KaxnC7tt+Ud4O1_gm6WUSEj-=aQzS3KHPVaDyQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and
 drop redundant error handling
To: Michal Simek <michal.simek@amd.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Michal,

Thanks for the clarification.

>
> I am not saying it is wrong. I am just saying that it should be likely handled
> as separate change/patch to address this issue.
>

I'll split it into a separate patch and send a v2 shortly.

Best regards,
Phuc
