Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C2136EA86
	for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 16:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345588; cv=none; b=fygCY76hCdvnQMrmlOfB9xMJScuwlHB+tMmMg/czQhx6KIjhMJGDOuwOzNMUqlSaMYOrsGWWeCc8rycV46ybfaMR3nvMct7P4CE6xRuwPFqzHwdfFafJOkdeX05xOzmN3EHb0IH2+1GQ76+gBl73Em0vdEKRm3P8+nHFA1cPtjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345588; c=relaxed/simple;
	bh=gb46PcwKOjZgVpxueuCR1R4DivfMoXbIy2Skseq0pzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KmhPtlEFd1O4Z6W/q7qWDMNzp6kRqJ8+MHRCQh/lgEHGGWgkl5V6ISvA5fjKv3Z7SywKHa34rk7hMK7lbk/ceNRQagIulsb37ob1t/Geh68B1dvIqJI84ZrryIFJyi/dwBinuyhG00OYFMca1/mWhChibd7CJ5IPrBBzM3du2ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G3ZxmR6j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G3ZxmR6j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771345586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gb46PcwKOjZgVpxueuCR1R4DivfMoXbIy2Skseq0pzc=;
	b=G3ZxmR6jYORimLnHt1XQJ+IsdxcNDWc8Q/VkIHUtG1u5vGKzIxkQ6I3ZXmxsoAuJbLp2eT
	b893KPN0kVMKUAtl5Q7JFefaf8hklzkyyxgAI8ffF2tmR+Sb6t7wDgnJENewx0dmudlOYZ
	flLifXia/JkLH3gt6HujVWmkBmosbnk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-0rBM3gP7MUSSkRYmfTOk-Q-1; Tue, 17 Feb 2026 11:26:24 -0500
X-MC-Unique: 0rBM3gP7MUSSkRYmfTOk-Q-1
X-Mimecast-MFC-AGG-ID: 0rBM3gP7MUSSkRYmfTOk-Q_1771345584
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-658b82db041so6011135a12.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 08:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771345583; x=1771950383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gb46PcwKOjZgVpxueuCR1R4DivfMoXbIy2Skseq0pzc=;
        b=Pt/Nribsj0Z3wWK5H5vjrOgCNsEdWgN9ZBEsgCmbjZp6XOOxjOJny2SE9uBuOWvsNl
         N2yLnHXk0KkQDcNDj+Yp9QNXRjP0E7wK6Ouw34Lxg/ccwDouhY0gNhCfH1Zzd5f02qq4
         8fHU23P/Q5nh2qB7lXo5BJWADR6qjZZ7DYUTHk4mugUpYSoELIP1Ov45USBJbdRa1BKB
         uj7wceNRixABjEzI4tzhayd1By3dlFbJYHb161un4ve/8per8f1WgcDOK4iLfnlEn+LV
         8qoUW99+NCE+7SAx1/wuY33My4UHU+EGEmvgM4kKLbwKpGh7vwOQ0vlFzGfNxKWEonVY
         f26w==
X-Forwarded-Encrypted: i=1; AJvYcCXMB1WFPWj5FPrllceHaC0uToSlzU7QC2liMz47r78qj0dRkePp5TAkXxNIHFQcLqaNRj2bgFQ/YcLXUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmIXU6svrs7BfczLzzdRRr+XVcfbmIbogD52QRDcneuLRI1jhW
	pM0lQ3qBMVoMuaa7KGzrPmH45JHs6AU9YvCszlM3qM7Zeg5fo+djo+X7PzKwcsJBm8I/fW4Khtb
	AMfhQ3nJGvMyjEuxCS0tbb4jV1bwKJslzK6Ci06PmZdUUAq6JZ0ro2i1eY2o47AIc3LS9NrYwUg
	tliaSPQBBcTwBEOdLXaOXLNIZFAoHQtrZWyiUNV3o=
X-Gm-Gg: AZuq6aLlA5gG6cqnLqKeDfO7rJ4lWF4zF8ChvOncwHxFsmrSUI+IxU/susQL2HFx1xw
	U9BWe0WV8lvwbyPVleQ4kAN3FR4rhcu8s+gSeNGDm8dm895/qsL+TDbeKfVSV7DPOTQwu6tZ77G
	WipNR6bQTlDqfAeyl8FNyH8jN+GW6GD4VvyKYDugatKqIhNootBcghmSaxaf8ELDcdHYqmE6UJr
	Jg8CZA=
X-Received: by 2002:a05:6402:5254:b0:659:40a9:713c with SMTP id 4fb4d7f45d1cf-65bace36a55mr7422683a12.18.1771345583614;
        Tue, 17 Feb 2026 08:26:23 -0800 (PST)
X-Received: by 2002:a05:6402:5254:b0:659:40a9:713c with SMTP id
 4fb4d7f45d1cf-65bace36a55mr7422653a12.18.1771345583183; Tue, 17 Feb 2026
 08:26:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214004314.3787727-1-tim.bird@sony.com> <DGHCVCRACU6X.2KYOL2RQWEUG7@maslowski.xyz>
In-Reply-To: <DGHCVCRACU6X.2KYOL2RQWEUG7@maslowski.xyz>
From: Richard Fontana <rfontana@redhat.com>
Date: Tue, 17 Feb 2026 11:26:10 -0500
X-Gm-Features: AaiRm51AkDDvx3UrwmQbESVGd_4q3_QQ9Fam79zJStzxYIszji5egCjive5DA_g
Message-ID: <CAC1cPGwgwPJUssJwtUmVydXEGeL-3vD7h2z5_Hb+4g=mYJfhHg@mail.gmail.com>
Subject: Re: [PATCH] sound: soc: Add SPDX ids to many soc files
To: =?UTF-8?Q?Piotr_Mas=C5=82owski?= <piotr@maslowski.xyz>
Cc: Tim Bird <tim.bird@sony.com>, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, 
	broonie@kernel.org, povik+lin@cutebit.org, david.rhodes@cirrus.com, 
	rf@opensource.cirrus.com, cezary.rojewski@intel.com, 
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com, 
	linux-spdx@vger.kernel.org, asahi@lists.linux.dev, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0Bkr47aBEo3Xw18bggwyqUTNXafUj1CUPqvThF7iNSk_1771345584
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 11:00=E2=80=AFAM Piotr Mas=C5=82owski <piotr@maslow=
ski.xyz> wrote:
>
> > +# SPDX-License-Identifier: GPL-2.0-only
> [...]
> > +# SPDX-License-Identifier: GPL-2.0
>
> Is there some intended meaning behind this distinction? Bear in mind
> I'm not a kernel developer so I might very well be missing something,
> but AFAIK the `GPL-2.0` SPDX identifier is just an older, deprecated
> variant with the same meaning as `GPL-2.0-only`. (Just like `GPL-2.0+`
> which is a deprecated version of `GPL-2.0-or-later`.)

Several years ago the FSF persuaded the SPDX legal team to deprecate
GPL-2.0/GPL-2.0+ in favor of GPL-2.0-only/GPL-2.0-or-later. The FSF
viewpoint is expressed here:
https://www.gnu.org/licenses/identify-licenses-clearly.html

Personally, I think this change was problematic.

Richard

