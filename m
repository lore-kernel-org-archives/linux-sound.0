Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132823271E4
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 19:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762889637; cv=none; b=T5Jy3nrR4KMJb2iOneR4oMGTFoh4Q+VvdgstpWCpgdFbrZzGNvcUOceuFBi7mkEQyoyRAg3BaR8zLXphYlPuM6uipQCLNdzEcNajEOCFw+u5CraQn55Rp82Z0GoiDEF2XqtaS0L52q+Hmld0gZ51XwT4HE1u/M1Gfixscc8pKh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762889637; c=relaxed/simple;
	bh=iKW1tRsCgR0KVMBKgf6dS62cbBiXnxf4QwQ3NO3vz3U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TXY/wkqtOI/dBrdc+PocMza/AF3vrUjYykgSqDoWb8i36OxF31JQrtvBcVtESL0jZpVCgjGVkgJTEiTVGo6AgYwBcb3/lCeGBxgBAmowgNV62n4WgSDrtl2oUC5cAaab5VM3RPJF1lpg6BpB8MTiC79RLkR4DGUIIBpKy0dYo0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAjKBgPp; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAjKBgPp"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7277324204so23258866b.0
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 11:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762889634; x=1763494434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKW1tRsCgR0KVMBKgf6dS62cbBiXnxf4QwQ3NO3vz3U=;
        b=RAjKBgPpRbyd5u34Ww4SKPkv3x9dCYSuyRAg3/JVhHzBMJot9xOKFkA57o9OQiJvgP
         vJGQkBhFMHCiwxuBKoQxyQZkM+KScpg7SBC7oz3Y3BeZ2PcqsAwwmXbPgA4Gft1hazfM
         3NrQ8t78oBkvXV/jLsAfmiHLycDe6F0Kz/QomLfqyqI+EQsLtXIA1n+/ESV6lqoM6Sea
         4Wu6d2Dnw5luT8TGKOvTHeVrJVue6Wii0s3gQLmn9dEiurtAd+eTbnUW/GKLsT6DhSCY
         XeQV0PJfzRnb9V9U28202GuAGMsqwL6u3zSiH4VJI7d9kn+fLGfXI0zxml5p+MZ5UBid
         9d6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762889634; x=1763494434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iKW1tRsCgR0KVMBKgf6dS62cbBiXnxf4QwQ3NO3vz3U=;
        b=QK1xSyEVu3SFWIeYgHnUKyQxdq6ZXYS56JpaEGdJO/TrFfggrPZssI7ZOR1pPPgpzx
         pYSv4oRP4UyZhBp8zuaRot7RJ+RsSXSIugcqNvJXbWPIOWNNm0RvaQEbH1taX4iD0M5s
         WFbpQFjxKEoiDr2Tr/qlbTYEpeNhFd8ET79eoU26O+h8wgF/ZwLLTp8ulEd+ow8o7h5Z
         RwjY7B51Eo/LIfkIQLq89sMDQPxajT3d8uIvZBtaxBRxAhqzFQpJJoRDTsBCBiiohLri
         B6O0AkQBnFQg6PtDA103/Bo86nY8lQbeZ12lLZIC4Ojqzuz1dh55qlZHfiYyIXDWYoJ4
         Qb4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYrlHRgU6X6X91GXxl+pyAfoCVLSTkFEP/RdpOEbKWiY1ib7Lgny6ddBzMG62EU49IiDPeNR9yYYtSAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYUHnVFI+ZCjJWd0METToT9qjGDErl+XJQTic2btpJXZ3K85RK
	uNldvFoo0Yl2nVHw/ni2I39ORjPMjT2WIzl3Ygk4++4pIYY4/mdg21LJ
X-Gm-Gg: ASbGncvam7l/qSeXvPh0vYcle3kpi2byhUfpVlUynsPlZvDgbb4NTaGulThB4hTqUN7
	uZ3bnxPhLeo8hi7cLvE8vTYaE5W9GtiXterPl3faAh5JAV/rG5xH7PX1iT/+hXsDQr5AEVd4RBc
	NHt7tLEYrxi2dsK2P7Pg1xL6lrrk0CnB9CM0n3QtdziHQMt5H9Cq5WB4pdOr/RIc3DbWtRIAnsj
	8M1iac9FMYlAM4dDmZJzCJ+6LSkX4Ky+1/uxrjy6bjh0H9GMCSG/pWebOeaB4/ldKq2akCZ2SU4
	Qh3EtNdv8a6xCF0rIIPF0e0fQgUvBZWPRiVGj6+sIc7teJ/ao8EBv/cJDGsiYqD4SXJSb8Rb9kX
	zEep4asWENTEmYChxXRcrqtS75bKDPGPE4CL+VnlROApLQyCuXpG2uIMtsC5IeLr6ubQbP39oDU
	wd3udyJ2sh9g==
X-Google-Smtp-Source: AGHT+IHDUjKUNAsSr1F3fZIpUNhiYNKUcUmB/BPrX2k8vNUcQxHLIIesAmw2W01qUzcV5/eYxTxFhQ==
X-Received: by 2002:a17:906:fe44:b0:b6d:608c:838b with SMTP id a640c23a62f3a-b7331ace065mr28182666b.45.1762889634237;
        Tue, 11 Nov 2025 11:33:54 -0800 (PST)
Received: from foxbook (bfd52.neoplus.adsl.tpnet.pl. [83.28.41.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf312240sm1428843266b.18.2025.11.11.11.33.52
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 11 Nov 2025 11:33:53 -0800 (PST)
Date: Tue, 11 Nov 2025 20:33:50 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Rodrigo Lugathe da =?UTF-8?B?Q29uY2Vpw6fDo28=?= Alves
 <lugathe2@gmail.com>
Cc: linuxhid@cosmicgizmosystems.com, bentiss@kernel.org,
 dmitry.torokhov@gmail.com, jikos@kernel.org, linux-input@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linuxsound@cosmicgizmosystems.com, stern@rowland.harvard.edu
Subject: Re: [PATCH] The Edifier QR30 USB speaker, identified as: Jieli
 Technology EDIFIER Hal0 2.0 SE 2d99:a101, reports a HID interface that
 needs HID_QUIRK_ALWAYS_POLL to ensure it does not crash when changing the
 RGB brightness with the physical knob.
Message-ID: <20251111203350.3c9a669e.michal.pecio@gmail.com>
In-Reply-To: <20251111074205.1533558-1-lugathe2@gmail.com>
References: <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>
	<20251111074205.1533558-1-lugathe2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Nov 2025 04:42:05 -0300, Rodrigo Lugathe da Concei=C3=A7=C3=A3o =
Alves
wrote:
> Add a new vendor and product ID entry in hid-ids.h and register
> the corresponding device in hid-quirks.c with the required quirk.
>=20
> Signed-off-by: Rodrigo Lugathe da Concei=C3=A7=C3=A3o Alves <lugathe2@gma=
il.com>

Usually one would use a shorter title like "Apply quirk X to device Y"
and put explanation/justification in the longer commit message (above).

Regards,
Michal
