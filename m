Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8020D481AA1
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329089; cv=pass; b=RPIoEVD6SNZXU6KMFgtS9IT/y2an0yg2rstBorKsNKr2horq02EVZuBXdCYh1pKaejPDXX/v4iv1ItpoCfieJlr8Etlm8bd5rtZ0lHsKsCxRPvX5HcKc17jFv8bKroAMIyz9XHic4iHTc3k9mE02oJk54gUZ5ctDoxT/QNlRqdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329089; c=relaxed/simple;
	bh=FZDjz/F55Ie1M0v56bfpoehgRTLCH7hYAH2EKNVwZnY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=e30M1yj/msvA6R2m9asfEs7C9SulpYRdj+NM8NQztTle6z5/jZbvmolj6IW8bvSHJNLFs0W60kWBeZr/EfwBbR12d5okp0EV+7zGSbKTUtEBGMyV6X4Pnr6arqzZf1QNgJvERgaa15ZW728TncyDX43VOmGvIOmDmcfAqrgDTLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHmKnWhX; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHmKnWhX"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84a2dcede83so1161125b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 05:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785329079; cv=none;
        d=google.com; s=arc-20260327;
        b=PrmBhndhGHrlnAHRpdfm9OYw785jupQUYiL22I+YhK3N3Z6+eQVIuVOKafGIjbaJpj
         W8dTCXnIi9K6sSsOXCS4vkVy4lYLB4NeeKEljh23ZUagZADv3DuO4YeuiGSWwLL1XfmR
         Zdw6k0SISXrIv8kIHXiQbHATUqX8VGC4Xli7uqR5b3x3CAZo9SkpitSG2S1tPd2CJLJJ
         gsl9xbZGUcL1fN+IuJse6A9lqQFRf5aDhgWzKuiYVXw4Ql1OF+bmg5fLH1xTXFPt4dxJ
         at2uj8fC8BlZsFfnpkgdv8772j2mwk5nFUl3LXPFVeqOf/ZWBxlSHiR7Iel5CJjB/FwH
         suqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=FZDjz/F55Ie1M0v56bfpoehgRTLCH7hYAH2EKNVwZnY=;
        fh=I5WbdfwyA7ftARIoyL9al2xQTgGSgDlpbIRPJ+BoAhk=;
        b=eRz664/vgVqbzVnywS93IlIbTHLGR+2NKm45KePA/G/u669UCpgzj61Ll3tVpuyTKP
         UbvetGpVXFMOS9Szq1ahFor+ryxF+R9mmo1yucNMIJXOQPgIWzEbyrK2+YGGln5IsRNI
         NKl/ATUJNlL4s/AOMyCeRNKdOPHr1gy7RBKdSZAscT0NzEiNJqAaBO25SK09KvtWXh4M
         SN5KXbpvsrqC9IaQxvjwblHKBbA0Wa+EX6iM8bkUBZTQYLwLMK38Be+EyHlEG3xfHm3k
         H2SCI5m37NWY0FQHC/mr7nhr8wzy7MTiYgqO5wCfum/w2X5TWcCrYlqgdUc/kaMbDJVW
         Pq1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329079; x=1785933879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZDjz/F55Ie1M0v56bfpoehgRTLCH7hYAH2EKNVwZnY=;
        b=QHmKnWhXNEhPoaM9N6RX699JMx1ztHLbmma3zlB0OwLWJVf3Q1Oj1FT6eMl7U4aBH/
         uTU8rWN2WB32x3J4IMbmjNUBs3WlIMzgU0ZAPAWpI5van/LikKsEMUj6hg83udsrK9VN
         qo/zCRzOfdxzADXKSEkGo0QXGeS562JrUq0SSnmpdfyfAiPkHBisbp/HXgw80T+MNL+x
         VrhKbVEymuP8F0w/1uJymYFi+nv8BUYGvLPSA8vd0yRvzm/qMxM+o0Q8tk/nqYdZZO08
         lDNr1vAuYeXuxD/P/CRn36vJpQCDGtT5zw+dRqF8HVPGsQhagYjULEZeiKEhqW4ZBgpC
         vE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329079; x=1785933879;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FZDjz/F55Ie1M0v56bfpoehgRTLCH7hYAH2EKNVwZnY=;
        b=aEQAVW9GtWLOSj1W20wQHeMGYNk7f5qb6IAE96QALGKNdFGyUSem+pnQEgY95+NRQU
         R5G+lU/+B1BbJo0R0qKSkzJRlKxkVZsuKG5BVFMvE9hPMrVaguol5ztm2lZTI1lSPJrJ
         WrvGF/MSWhB3C0zzVoRlK1IgT6Zy/CjDHDFFraZZ0E98xzaqSqpChZkCx4ykIDZ6f8n4
         gx8JMfoQ8XEFqCt2AgMdU1jd2Lj9nJeyFgIw6IpyJZKjsHkBFPdCjKzCO5nHg/2lCluQ
         nMTPjirkAWph1MKFJJGKs2n3LQ92Ej/LeG8PijyVKHZX1jPvrzuSckym11/Chtke9BHZ
         TVqw==
X-Forwarded-Encrypted: i=1; AHgh+RpqrZEzeFG7CJatqHrJhQqHCLP4t9+Zcj7D/KZz9H7hvgzxFLM8C6xSKkcyf9187jli+lCQvErRE8S6jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxr4qaOAvyqX1wPiiyH2Z7Uo7enHjDzR1aHk9ayi/U+HAW5n99
	4cysfGwgI+6YUTObjzCTAt2scdu7uXb39hHSdIhCFDQUKNTG5dW5DIqgD0KZxSsbIaVQPWyIChX
	Mt3WfitYOlCjXj5mh1GenYXpaJdKx0Lc=
X-Gm-Gg: AR+sD10y0kQNnfgYxtMjdzBpgYdnpoQWMI0mfE6qTbRzG7xAzm/6SIOud5GJga/cgCy
	3IRD67wom0vbpg8JH2hKZA4RzcEe9CRYkgMg5GxpHhukc/ynp/U+++Yud5vKnB8xUFh7cHcnVqP
	2r9CrcBCecXrt79omEOX4XRoiSzrNm26lCmBa1sFIBYk6cB3x7hhu8ZVYHtAgjCroGHxhKSb+JM
	gg8Uhv2fcm6hyeARkzpB2C/TR2V0/+MxeWhf4yD1j3RjC2HY1VkMrFErCvO+oyPx7R5Lhj5o6zr
	UtEVJuG7sPbzlA0Wcj8GZv6/iNEOO3knMpugk+C2n0k=
X-Received: by 2002:a05:6a00:35c4:b0:845:e432:e93 with SMTP id
 d2e1a72fcca58-84e9331e5eamr7041497b3a.48.1785329079445; Wed, 29 Jul 2026
 05:44:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Pengyu Ma <mapengyu@gmail.com>
Date: Wed, 29 Jul 2026 20:44:27 +0800
X-Gm-Features: AUfX_mxA4etvlqMH1AkG8JNXFGenrt_C92n1wg3pKM4Nj8bFnD6JmwEU7iPTaME
Message-ID: <CALSz7m1iW_hZbkL56+OMLXm5wE2s+ytxT_oGEU+DHyvYEMx8jQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ALSA: hda/realtek: enable AW88399 on Lenovo Legion Pro
To: marco_giunta@outlook.it
Cc: broonie@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	imitoy@imitoy.top, lenb@kernel.org, lgirdwood@gmail.com, 
	linux-acpi@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	linux-sound@vger.kernel.org, munzirtaha@gmail.com, nadim@symbolic.software, 
	perex@perex.cz, platform-driver-x86@vger.kernel.org, rafael@kernel.org, 
	tiwai@suse.com, wangweidong.a@awinic.com, yakov.till@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marco,

This breaks 4-channel playback on SSID 17aa:3906 (Y9000P) and
bugzilla 218329#c31 reports silent woofers on 17aa:3928.

override_conn_list(0x17, {0x02}) forces both speaker pins (0x14
tweeters, 0x17 woofers) onto DAC 0x02. For a 4-ch stream the parser
needs a second DAC, grabs DAC 0x03 from headphone pin (0x21), and
assigns FL/FR to the higher-priority headphone (muted). Result:
FL/FR lost, RL/RR played on all speakers.

Pin 0x17's hardware default conn list {0x02, 0x03*, 0x06, 0x08}
selects DAC 0x03* which has full volume control. Without the override
the routing is correct: FL/FR =E2=86=92 DAC 0x02 (tweeters), RL/RR =E2=86=
=92 DAC 0x03
(woofers).

Does this affect other 4 SSIDs (3906/3927/3938/3939)?
Please drop the override_conn_list if it is the same on these 4 SSIDs.

Pin 0x1d is already 0x40600001 ([N/A]) in hardware defaults on both
3906 and 3928. The override is redundant.

Aaron
