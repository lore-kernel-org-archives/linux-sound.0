Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710364;
	b=h9mEFiPbn2TWYZd/FxWKf8ann8Z8My1o4RDUp4wLFgFOjlW8rNe6IoPtSdlf1grCsmqK
	 5gL1tDpMqA9T5Zga4/YnfRXm9K/W1sy6aCVLkVm2hnwGNEqdqGItDxEevJX9BFMbrl5HV
	 pyE5oFEIZ/OyeZNLuQO4Ry6jK8Xu3bkPJhuF8mJLHjc123xMiPm7mmZFA3CNX5u4DFFnD
	 hLAEFlZpi6RN9Mj0TWt/Wr7scJp+7kJnG8hMGJbyzQccXfsujFkmU5XNGu6dtpMIrbykS
	 ajahda9pxBysNLG0/caQSr5DBKmNFit3gSRlpYA3+ZCgNtINckvNE/xK8W+hwLNZlqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OxChCZD2o0yQGRgsO2CGIoKtpGo86ALe5rnyFgOgtTE=;
	b=Lv5cF4rg08ml0Av16VJ84U/Gm9pEgiTLODwlREpjYTaGZKiW4ctdCBNBrc0+OINDO6kn
	 Phd9TKDMJm5NSBiN2zyU3pUPCr+/3A+KsvWsKkoJaCDlxKvq18vPgYKBi3ZOiVvKIVejr
	 a84lc2XobCOg7j7PVuSOKlidJP/u/UqWZnAt/RdgwEWKXfL3cMK/blf95g8gq761Nsahl
	 4qLGPKIz2ngF4ZY7Ke2p+kcHB8vmqKwZ/NmvLi6MC7e8x0iUigo+F0k/2BMgOgvQs3cqW
	 zUQVKKFjpSshMr8fFJgdWUZ59y63HbG4ffgzqy7Pt0fudsy0NVUiGs3nRJLm06rQELg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5LME5TA;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C07A606A326
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 12:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C07A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h5LME5TA
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3550c917fd3so5635591eec.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 04:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793710363; x=1794315163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxChCZD2o0yQGRgsO2CGIoKtpGo86ALe5rnyFgOgtTE=;
        b=h5LME5TArfJBnxSoUoZoGTGBbOAQ8cXaX8FXX36hNeDm7KxiIgxeW8yJvVjI+BXbBX
         eCQPc79CPCNshV94OejJVsBbYxzBFyrDdS0dt0lVfKAMgl3B4bGZOmflC7yYVmznRkYm
         dflLBFS8FVPXZCvJqHOZWSSN+/EB4MK+URtSTWwxvX5JBo9rKGb5U4UDCNFc1mwhcnuh
         9lU3VHhmZ9HBRzUh8msVdzk+RCVJNvotW1jyj1snEHD1mEKgEjkPqdKdWRa6w/3py9op
         +W6FkYNxcy1SbZJGDgiWaPIfskdVx2lfjwkGXaizOIvk5eC2hF8d3VgRpiBx0280bk9p
         t0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710363; x=1794315163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OxChCZD2o0yQGRgsO2CGIoKtpGo86ALe5rnyFgOgtTE=;
        b=Yl8eVWeKz3uAaK+hrQUN4lhvfYO5yv3TRQXmgAPP2pvHkMTf+Qm8lIPa0byPQyjAec
         ZyFdY1ABtiOddqFRFxBhSxsJDjGqsUVnc9CURpl2UO92gx+oRj94kLlbI6EuIxbRXIw9
         jMS8IHCbp/U8vWgZyRACLvtHvMRLvGOW5slOmZ7RUedZbgnd3KbuJTDE7Bk/QeTuums0
         /wAh25QMLAJVt0QwXpIhZKZztvRtuZMHBBeuIRDDWs6UtnyWxgAE/aBpcsNtkbr3JiDV
         PedfXWyguIs1zvSw8A+jMfHmkKiJYTdaEBjmZs5zATyyWTILLfp1qJ71RYJ9N40AFWI5
         PufQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiYE2e6Zsn90KqxBm/A+TSXx8zwsNffD3W+seUTgEjP9zYVPx1LyGlJr+H67nlrddkfAh1FCDINoyH4Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8O8tIKXsPTnaf+RZ89MAUiWKPYM9h8HwaEnZL2Im2336SVS/HT
	Vw5REcMqOw7bX4wrxk6xULb6xoVUapHDBM6u4P2zCx4hKl4zZ/OzENFgRP69+w==
X-Gm-Gg: AYBFou0Ja0wKjr9l+de6JnirjEJuO34BWcn7n4c6EYIsWMitnnTHuuJ9Vofe/l3G93c
	YvqzhA9bW1lPennFvMtrSyidpNYdTjXX0fMVMnYoEe8aT55+hP2EyHmhx2UXgc+xJ3ex98ST93Y
	BSKO1So97npyQFU7jW6RnjvIHo3jAm6r5iOCD7WbxsK5BQt+V6cr1tt6O8xe0uZCwf/qdmtTGBR
	KKgvZlchDv73z9vmBKY817SbKpfNfD3fek9GGto3k1rKF8GHTRMN14aW3Dcv6eaPi7RLeef6Wp/
	5FYRZ1ByuTKgi/m1UqqLWdilqLqQSoYtLzfS/1D1vztGVV5+P0bVIUZWZFUQHPBJwtXEsPazpKT
	oqs3Fkpmv3hT6Zc+uVYVZvhZPTXuz/WWLQ9pL18HIkglwc8Z8IwShE6ZTxLLVWyRfyzY3cLy5nW
	QJSyJaxBdxUclYixon8iRF8JcZrxYM95sc8qsDMsYw1eRfxtsZ1/yjXJ+eHqds7vRGz26EPwZoh
	ntz5uUQHErUCTbnxd/BwcUiwIAHAPWopRORJamZePBm842vyfskB37TObSZXcsg51rXUy1R17dx
	whnJZrkaT/X8hDomQr1WjLcBCjdfZKyOAicW7oqu8xPAhDCf0Uo=
X-Received: by 2002:a05:7300:d58d:b0:35e:f1a5:9ba6 with SMTP id 5a478bee46e88-36a4221aca2mr21618441eec.5.1793710363113;
        Tue, 03 Nov 2026 04:52:43 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429000f8sm48196220eec.13.2026.11.03.04.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:52:42 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: cezary.rojewski@intel.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	rosenp@gmail.com,
	sreekuttan2156239@gmail.com,
	tim.bird@sony.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: pcm: Fix source frame count calculation
Date: Tue,  3 Nov 2026 12:52:11 +0000
Message-ID: <20261103125211.3484-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87pkwn8ebe.wl-tiwai@suse.de>
References: <87pkwn8ebe.wl-tiwai@suse.de>
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

Hi Takashi,

I would like to kindly follow up on my first patch.

Could you please let me know if you have had a chance to review it?

For reference, here is the patch link:
https://lore.kernel.org/all/20261102135034.2751-1-sreekuttan2156239@gmail.com/

I would appreciate your feedback whenever you have time.

Thank you for your time and consideration.

Best regards,
Sreeraj
