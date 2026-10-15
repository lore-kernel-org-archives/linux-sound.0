Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D071F4FB9A5
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 22:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102543; cv=pass; b=Vd6jaTDcP7RrPoNmu+vY8tuADLep4u/GYlOIw5/+W7wPujIUyirqpmALIvE0sCMAwan4Xq+UJLMUkVHdzwlj0e9AS1+91Bls/cbe5u6PHIs1aVzE0iOSz+BWX53ZZUazBhE/rQDEYnFAzlzImslEAHCVvm6e5C3UlbIZ0XD4zsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102543; c=relaxed/simple;
	bh=zanHTv7/ZyeQZHfsKPwin8RvJ5IaN24s1ZpGmgQs7Iw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=i/hi167HArcPV2nU9a8n4wVcM2weezeGWbCJ20FxMw2jvSjZDBev3sQEbo545oz9PIwbpXj0CQT3V3Wd0nchbm3rCDpSmY+h6Nzf6D2zxY/yYyLuRisjuO9qu5z3j4MrcGxwu96PAsPkDfa4H6p8RTIAKAOAR0KOVOYJUKrMftU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdsFIoAz; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdsFIoAz"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4d870d54so3692061f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 15:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792102538; cv=none;
        d=google.com; s=arc-20260327;
        b=iQqyZLQU/auyNUTKUW/6Pg8Rky2yunqnR27IyapN4HLj2R9TQPxl0ZhCu+tJ4blc/8
         mGQUh5xpGaKm3QYgzbqTfs48eLP4Cf2yZUsGGD734eNOABwEdLaoOd/iSiCM9R7R98S1
         OzfXlNKB8PcwFpzMUfkPHVyYO0457KfhL35KkjTmSj7CGknnHSXfLTvq9+fyQQTlgQwG
         36g2D1dCcYf6Ouy1YF5VXLrXy1q6CO+aMMFdkaPiY+ep99WOtwniagOeLIW99AJfg80w
         vQkcOdy//Z4I/mn3gO30AQP8F/scM4Xj4S5+odza/hLd83TU+H4zsESLmi60kVrQo90a
         31Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mY+ZKTXmFpVQKg1buOuqoKdlktkLZpEVgeGpGNQXfgA=;
        fh=PlPtM0Vhv3JnHSXZZr3/OE7sxRLIhDSLdWpaLZDzMwg=;
        b=qvCr+dSWr5Xppvp4CGuLi4K2BZefQ29C2IlI8gSR5DMIaD6qT5NJ0JcWv7lmKPb8LF
         I9hKtOK2iX1GR/i8Q/RAS6atbNDgS7aObNbtLbhVRfpgNrIeFXzQaiontOM39poorvAK
         N3gaMGn3kKbYrWjmM4XXHke16TC59OmwVDIXIjOIivngGKHB5myocc9FzcxxnTlbpUjS
         ePrjaemr6YfztEtXDFOB+Xaohv4AaoWzyRfvZM13672Cpd3eOdAcRfjnggAIOnNTXB6p
         BhL8oNSCWGRUevF9ofXyZMZKtODP2oPppE/yX7LifRnoBTziiCpd0+yhGepcCFd5gK8c
         IM3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792102538; x=1792707338; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mY+ZKTXmFpVQKg1buOuqoKdlktkLZpEVgeGpGNQXfgA=;
        b=YdsFIoAz5tMpNxbL/HhMHEZhsXlYk/M0bZSr3AILBnLvNWnzRvL7yrH9GveT4YxPf9
         T7qKZciCJGtjJvpwFHg3RRuwugWZLG6wFHiSXe/YpR/0wJw8l2sUPMHOd4RfIgjfI4M7
         hiA13qrgpAjabUATywgL1f1/5NW6C+igfmnRV5dw8FBahjYJlUlA7H8ksshuk+Oz2/2S
         XT+1CwMnkhl0GBMuJ24WE61xAimgqcTRCSnv3Taxro7wUeK0WZfs+J4bUbq+Eu1AlavX
         Qskt11sSb65YQhpuxHG/V87JFp6DC4vf0nxWPQQEk3apOx3/zpcJ+p0FNslxWtrOaXAL
         GCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792102538; x=1792707338;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mY+ZKTXmFpVQKg1buOuqoKdlktkLZpEVgeGpGNQXfgA=;
        b=IiZC8bzk+l9j+7dV9iZG0IcyHj1kkOHja27+BamunrBQV7yAQ/k4DtOtJPDqO45ZJY
         WFAgt9sRiTHy8ruKy5UDJ7m5AnIKSMk8nr4AzZ321WcT2EGrQy1GAe911NolHWOgXJiD
         XkQEo1DWwYrPCtSjfQuZE0rxQINViKqIelNDfOr4cvpJellh+ArZikpTxB5xAShThXYH
         1S/B7fIXchxuTGrNWSGuHfqAWnDuTxYlcsEKCI1x58Ebh4k/mxqcZKAuW1aKnD2U/10T
         u+uCnKKRxylEl/xS0ASGtAV78sitDd8DIKO5sLq4IA4wmIIOMziOcl5zF9I8yA6durAF
         d+Nw==
X-Forwarded-Encrypted: i=1; AKwUvBzq8eSa08WF1+j01bhFp9L1idRtTZTGsSU1YDby9c7u7wrjrmAxZ1ugP6yvdOZH83s5FS++R+6zM49+xA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJcqJ99RxQLeupQxGWC5xYX/owMVWGM9emufWGLkI9MtP4Zzb2l
	8SmyA9ETRIPaEdQtCu8/OgPRM34Kc7CoULdtpXwZ9hJ9FE0QrJ8aTJsBdId1rVK9gGvi059HNlc
	aQZ6ZsccJD6fcpeSrJtBSGDOHuUKEDXEPQgHbKw==
X-Gm-Gg: AYBFou0Lb3d65+42yJr3E0KzgWTbjv0eXYQ7XxjVUkVWUjdcloMIBP/TOQ7uYyLLVtI
	+BlbDho2PhDx/YPd6f8TxNnoz2K5eo5Sdjz4kFX+1jPHvQzGfqW0FhvzJhb9UoFkvmkJ0nMSwak
	LpNbMo4nOFGPvGaRky/a0e5oXO6LSpO6j9QQwdZWULayhbQP1lA2nIGkzqd/FHI5/nmjuKtHedE
	ODJQVkuSZFF/ex8nAODjI0OJYuySyTW8tgfeUBTDSLQQLbTkkBQv6c3sx8WkEe3VIapH49Hm9aG
	LopTfrFBT184u0aupGlFKk1nwE4pT2DiZAKTK71/F8fV0IQFtzu5WRO2y+D1RdfEDwU7Iw2tanr
	k2NzNV/wWD27khwXKc3Cu89JWR2WLDexu7g==
X-Received: by 2002:a05:6000:4b0c:b0:48d:f3a5:4563 with SMTP id
 ffacd0b85a97d-48df3a5458fmr8712443f8f.20.1792102537577; Thu, 15 Oct 2026
 15:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jon Harrison <jonerickharrison@gmail.com>
Date: Thu, 15 Oct 2026 15:15:24 -0700
X-Gm-Features: AclHuK9akDF_HJC3l9c7A40e1CwGae7kkonYhBpFQpvWAgTE0uxWO6bwEHSJbw8
Message-ID: <CAEG=48+jRv7wHgd-yPTHEf9YFO++XusKQgT+WJz60hgCE8pGww@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop 16-bh0xxx
To: skbotnl@disroot.org
Cc: david.rhodes@cirrus.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, perex@perex.cz, 
	rf@opensource.cirrus.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2026, Stefan Binding wrote:
> We are currently awaiting confirmation of the correct settings before we do
> so.

I have another HP OmniBook 7 Laptop 16-bh0xxx, SKU D2KR6UA#ABA,
BIOS F.12, subsystem 103c:8e60, running Linux 7.2.5. Both CS35L41
amplifiers still fail to probe:

  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Failed property
cirrus,dev-index: -22
  cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: error -EINVAL: Platform
not supported

The speakers only play through the Realtek fallback and are very quiet.
Has that settings confirmation arrived, and is there an expected time
for the quirk?

Thanks,
Jon Harrison
