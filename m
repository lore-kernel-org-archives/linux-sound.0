Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052299;
	b=FTekuMk9P5Ck0UzutB91TzfOcTkc9XPr7m6zH226ZgGTK+mEKmwAg/GBw/10nsVMF+o6
	 AzJjM2ZWaBdd82F3Ay2/GXSVE1q4gOsgCPK1rhkRzMN9R73bM4GlaMfLkCQOrHlKg6m+2
	 iNpAGOnTw6px3QNIvku68VYKxTb3y8BN76aLogqKZHU3p1Zjc7+VKs/6mX3rGGDl86bB6
	 gXj/VTU3hqhXZNSvC/BII8f7AJkyhRPjIqhubQCpoKN6ejb3Yu3dTH3a5w8uZNy60T5sQ
	 qrMpr8fAPAyqXUNQbrTsDjwCVLnv1rrQOw6McYIZxmY2wr9sCNsuvJeFzBmni0PBo5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=Ot1f9lehZ8tvlCoDutX+5VS5ae6mzbcD6Faei+O3qswGVwMUFZ9n4bRjNudzzsxYqxx+
	 GWxNFaNCE1cK8acrBMo7R7cc1r/ICCjjpL7jEafvfQlyE+M/Syws10FNWXMo5/eTK5ZRy
	 FiwWfym2wqEFell10sJ2tJ91SvoZuZPzYLZaMyUwo07/bOqeNevftr7b7NSZC0jW3gla+
	 5z/w9fPbV7dYUm0zToB9C+OJukacSTSDv8Nmv2WSFVaGkWpkxaumRaCMRz4Rtio8GfInr
	 5uGyKyFJfay6Oo6aoCUP5L+bgqAhHYW9LYqn2AEhKhtZQjlFHA3qaV6j+Ze7lMxRgIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XPPdzCdg;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E07606A32C
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 11:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84E07606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XPPdzCdg
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37071c0f42aso2007197eec.0
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 03:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794052299; x=1794657099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=XPPdzCdg4rd+Hd+hTQAnGhkbLeNkK7JIBtOq3oqxwvLzzdOM56U+i4rS08P6yTDqg8
         lX2XJes7S5ddqe2pC2gUZMNJLOfQzCJr9uaLHuuX1H0yge5EoC8Y1kZ0GB9Aq6rukyuv
         7DYM0y1NDojOJJytdsZMQMfzvWP/UavWnCt4UpIwgw4u2SlGyuThYGpCpCPHThkbdmqa
         LdTWIYY6qU4XO1S5NiQQr6JbckIDS7vS+C2D3nZUr+LfZWPZgmhLPFT8zJokLZU2tW74
         pNNVZWhgdQN+kSHfyraZCKlVF8z99K4miFLx8S/H2773mWjddKcVi7rw8xLwfJtpOEWI
         ChKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794052299; x=1794657099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=0WkOg4T8AsIeS9MckgmxY8SXVPxVfMJEMNALkgFJGWTbO0dIpD6mU/QJiyMw1REAd0
         UEQDxFIEP1fnmxsrcfXuNuYo6O90Dn6viF8Q178Z+5l/G/z1Jc1Cm5KWyXAPm1xMlZBA
         u2x8Ul3KFtfubPY6yrejXfV7NO5/MLmF6V0lcmZ2Yfpumjw2/L2vw45ywPps3oMhE2sj
         H1qyzlZC90cWYXtCMz1KzrHxu/6T+CWgF9djIxj1/IfYg/VJzSKoa3UF27G9wdbsOGm7
         1EZm/m8FxKQEl5sGv4O02FkUKxC7NEwj1FzGzhVmsyvqOXRKTjr8i0dy7Y6FbwHd4fcM
         +Kdg==
X-Forwarded-Encrypted: i=1; AL+hErEl60wS7jNtq4W6eF41NbPTLdj/Qsw66KEz+s3nWVJlzds2oSMghK1vfH62WQ25M8Q08oye5tO8CM2KHQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Dk1HxyTiIrc3B2M5CyV5FQnszhooVvskNOf+0dL4LFeFQvB94
	0iI25eAcyvvyctcDy1VKuw938n+PyJl/4vImQaY9jddexghFlqFL0m2M
X-Gm-Gg: AYBFou0UpwKIOfFNverG1xAND8SgIGpQl+ufVD0QDCUrgb1nblTuDzDuZc/qI7U3Q2W
	JmrwgoN3ZvIt6mgZPY86z1miZ+lnizyt8GHpc7KUwG9VFRtxNjCxdLi1CQUDSjcfRoZgK356s7r
	BC+MFstZ86rg7NDgVfvr1Tl+y8SrcaoxaFJEnsdTV2aTd99JI6oWmAY8ToBV2AggjGbpLeOvym3
	KXj86ie1heFfcgm3Jd6s8cuRmg/almckXg791T+WwdKwCPPeewi4DVYh+t3vlv9fpq/bISoRRtP
	cLnsD+jvDucibKpLLZMz8kgh7f/9pQlGD46BbV5bCn8NDYR5CFF09KmL8/ExHfkTx3/XzFXybk0
	aV5iG4ysjcf/FcQwJfLPdQq5w4njbc3nJMxm79XcwhDTm1OQR4We89NpKQDhl3EhJaqZQYLHkJm
	mMHNE3ZlcgH6VvcCw/8yjB1aputw0i/OLaftfdQB5bjBADAN0PE3s0k5pVy8j9Uynekg5bLE8Oh
	oIJ4hSEoHHRU5e07OSXBeIG5QedDDh8F50+Xj700u5WTNgmTTR4j6Ra1MML/nRV/WOAIE+9NRyp
	sdmpHtIJKRnt1LetgZPgA4zN5gT69GA87HKhTFc2sg/oZgkbNFop
X-Received: by 2002:a05:7301:fd06:b0:36e:16d6:f45 with SMTP id 5a478bee46e88-36f758318dcmr7145822eec.23.1794052298596;
        Sat, 07 Nov 2026 03:51:38 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm25945225eec.15.2026.11.07.03.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:51:38 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: control: Trim whitespace from sysfs input
Date: Sat,  7 Nov 2026 11:51:14 +0000
Message-ID: <20261107115114.2638-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87h5htypvw.wl-tiwai@suse.de>
References: <87h5htypvw.wl-tiwai@suse.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
