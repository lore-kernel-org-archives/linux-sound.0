Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793126696;
	b=sDUuvssgxgfh4qI8esSOLnZ8M4KVCRgBJId91dDVL1VJIDmTeSix4Wju9TLpN4obU6g7
	 lcpSx6UJX2dfc4sPpNXGUbP5ZsjqtWM61zYk8xCZYNsDSZvU69YZsvAIVpz2A7plXcd2r
	 R61+NpbqeQiumeqIaRTIX3ZILSaruBRIzgIts4Hsx4A3fNkSxinNqUsd52ogAMorAKSzm
	 +Mx1KQHInq7mlmXI7OTkhCDCGRAl5xsTqUakJhSjN3SLfqRk1ne8Pl0d0+JrcZmwDxLE0
	 pZ3oM9XjAk6qhK0PsUI9LUepob3UnAs2NGTwYwicTp8ngYMkZ4HTX8rr+Pgu7RXtkiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tEoWr6oOVnosU4poLjW2kjTOYuqBMD/9cOa8c5tjMMU=;
	b=UCdT6fcEdGlZ5iB1zwixiEyUdnKrMzZKqiCWtNzsolOGb+8m9/8En/muRJqVPqwGS9pO
	 gSWuLvO8iLvlpqYZ9PEQyIQFq2H4vELj2SQg1ySd6L9bkBjC8oTyjECJYryMsqWySIj8g
	 52lexwNvyFsvX1ZH2RjSTo1IybgBPqndz38i6CYP9poAZOKy2Zz9GNAO/r9eOMeiGeng9
	 mAKEaeiiv7j/B11p4IEyYu4r9gmuvjz6HIjSHTXRFpSaP00wnvnmBWbW9b3FurHlsCGkW
	 SxUH6Gtpl2sgJf2lVzPMkzW5g99Ubcmg0xx2MIMC6Avi5mOTQTNfmveD/Gt6Yx81wzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RZ9Tmw7X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792F4606A321
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 18:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 792F4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RZ9Tmw7X
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a17a332ecso207685eec.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 11:44:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793126695; cv=none;
        d=google.com; s=arc-20260327;
        b=IlT9Di7E6BMKdRf7tMbRxYmvcXGT17+iOrS+uQiUwTEGq1Yk6BnzbqzfU0sxKHZuch
         60KMgqt+pcYhj2R6QeBili4Qnndai9mqeWYC9cSdUyqxbM65fHAn/Ly+5YZjTjOsWd9V
         Z/HbhSxCT9UU3GehYG7LO1WtL+ylJlumbQM4SaD4Ra4oNVMw4u1Vc2K2BHJxHR/u4Ser
         ebwscFJNuC2DPd+3Q58OEawf7ibEGXRYGzEHd9TsOVnr+IHWH1hUCAqSqt1trhj5nFQu
         Zgrz6o3TbcxuhsGmNn6rdiB9hlrPo4VoEHueHp7Ax2MT0gX1D1cvMQnxdX9dDbl/35Xb
         xU7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tEoWr6oOVnosU4poLjW2kjTOYuqBMD/9cOa8c5tjMMU=;
        fh=qA0MoDK+MZMAFbEt41m5Nl6SA3vpfFR7tJ4SlOWKrtg=;
        b=GLPZdgnF8J9jSTMH2dm+rFOH8Ly2FLlX9CWCEkYSi2xL9p5jvAEgylL4ZMwRTsF6OK
         74KF2oDkFSybet/f4bHtxijlyblBBnhcHygRlu5mtyA+VJAHxRhThGseQZJgQ33AmJ8g
         64buFHuPZuZzzyfggV36P3hWC1qZ86nACsbK68BVfK/eLgmeIF3Jk3PiKUm3BgON8e3S
         Mf0MC1saBs62vObt8HQNhbGNP2YVibsPj8eE4D0tJX3Lo8Tp1BfdXyNt1WgmFjNT/YXa
         QAFjv6W9TZl4b5dNQCkmLRi/JLTMNRTt7DTuL5BaIJ10pfzO+0LDNduEI7472KOn8jDe
         2GiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126695; x=1793731495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tEoWr6oOVnosU4poLjW2kjTOYuqBMD/9cOa8c5tjMMU=;
        b=RZ9Tmw7X9onYeXIfmAJ7wd3QPCdcDBD4paScJ30dfXx3BWGyoV/6iQVFuzt/zccTjD
         /R35Yw+g8tOlNVl9zG9vBSMJgjxM/01FiXo4i4OMwmfBWTkYxrwCTYp23TJhNnIZrNUl
         5Td6Blf2bHUxOSbtHInNeN2TmSkk/7hRDPWcbGC29dn8i2aJUskeIehrHrFKYXyCVFqa
         ChvsxSNNwMjawkbG0F8uJ6EhS+Ro7P32dpB1Tr1pYwVglEU/MTXh2lSmWArCdzF1Ufqs
         8fXSzdJJ/apgn4X+SdnXZz/JC0H46gG4PTYJHNOcuPBLOwpeR4FONKL3Vf8zqXYbDJsv
         Ym1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126695; x=1793731495;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEoWr6oOVnosU4poLjW2kjTOYuqBMD/9cOa8c5tjMMU=;
        b=vemtDV13BEDZsQNe+X6NVySucHtdH/l6alPbzEWc1Z/6Qf3ucvFw3CmtIDO4ARcQng
         GZSVvbh2oK3KUT+bFaQDN5t4KpUSDklg9bwEarlwhodDB8w45/BZ4dyof4Kf4MiyqmbN
         SUDH5+USDZCtcg+6A3UFL39cDB3JG5+na29XOwOi/z+rN+lcIthXabVBVV+QGFE1V8ge
         mT5aY9SbYzfJ/JaTQJvrR8rkKAwLL4/kKlbYJM1v96LBqEohoqDkvrl5usyotdtr0D5H
         KaMHiG5x2xSGvJ60xmb9snE4P5q/YqXXV5i4DKt6ABxI9VPvuJMUcQiwyUt1yi0fHv3v
         X21Q==
X-Forwarded-Encrypted: i=1; AKwUvBy3IM5faeVpFwCgODe4TnLgeL0/7/62DAvCpOPydOvIraGU6fy4XlbxmejtPOpqRV+7saVbhGjhGi0cwQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKKrraePvPI61ogUJ+n3fLXsvYawdVS04hHG82BVwsjXqjqwjmE
	4lRNdoj1sxOZPZXZR5qENSERri2ByMX0WKI78OlIP48jdRYLmgffReKal9A8iaWBNALyF82aKDq
	74GR2K+/ktPdVgsrVMcGgPRmEZOd/MrY=
X-Gm-Gg: AYBFou1geJWFTxoU1iBws3Bj8dr5jqzFOrNxUqLLPLjGLhMIHPS68RVVafMo5X+6WTK
	vfaEgp5Whz6W4JFP+6zoFn58bI9fkwgiQJ9jBYyr4HzSVLmQYDtTDpkbGQpNPdYl8ZO5iZR6YL7
	r0uMZeTWjJksc233wQCTfbjquGYEp2E3YzwajfzCx5QVgVlFjq2+cZkppMo8k4TdY2LC+tXkYVi
	Rwa9bxqSitYHab9eTOccfQK7DcKHZbO7Rkv8595pgNX9+cy/SpZv3j7tIWueeGKwCvxC0w7NzvA
	s44iP2r7yJSLyKZ6z26cD4TrmD36O9oh4Y8Oj4VAvTmP2ujPkCEkoXoYwvN4r4pnZMpeutg6KNA
	/9o8tVnnYXf774DZQHhSFFGBKVcJM/1ccsfCsti2mw0fCnIDvlzasF7c3IeapNGt3brt67HJR7Z
	ZTsRmyUHAuTc2yK/s=
X-Received: by 2002:a05:7300:c88:b0:369:eec1:1d7e with SMTP id
 5a478bee46e88-36a2011245fmr748593eec.11.1793126695515; Tue, 27 Oct 2026
 11:44:55 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027120019.93611-1-clamor95@gmail.com> <20261027120019.93611-6-clamor95@gmail.com>
 <179312433904.199157.3178610408209114840.b4-review@b4>
In-Reply-To: <179312433904.199157.3178610408209114840.b4-review@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 27 Oct 2026 20:44:44 +0200
X-Gm-Features: AclHuK9YRoKNp7VL85UdMjrZOorWmZTdr54Qmc8Jf3CO54OLWmTMK4fUeFsGC7k
Message-ID: <CAPVz0n3MXT7_h6_REqcyayC_qyi9xXLNUjJLPzeyACFipr=TMA@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] ASoC: dt-bindings: wlf,wm8994: Update
 #sound-dai-cells property
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>, 
	Leon Romanovsky <leon@kernel.org>, Animesh Agarwal <animeshagarwal28@gmail.com>, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:0=
5 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> > The Wolfson Microelectronics WM8994 codec provides three DAI cells.
>
> >    '#sound-dai-cells':
> > -    const: 0
> > +    const: 1
>
> We have existing Exynos users which are validated with 0, this will break
> validation for them.
>

Yes, sorry, it should be enum [0, 1] my bad, I will update in v2.

> --
> Mark Brown <broonie@kernel.org>
