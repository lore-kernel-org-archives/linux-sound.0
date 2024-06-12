Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E8938382
	for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 08:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718179385; cv=none; b=Sr/Z39Uta4bPshSqhda/6jAZSJMhvPYp02Dxx93WzLbYxwVyzPqxs09Dqa/rSgOrhfCxh2FaYkD3V/t5HfU4aGjTAycuCW+csnf5ipRMyZukh1ad/al9y5Qsv3cSbzRtNd+6iv9NrC2UuAVckYeZ2qve1/zVltp79OZVbaf73mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718179385; c=relaxed/simple;
	bh=oZhvy6kkbKYCk5v6xkrBCIcY4DF51uW5QFIx01DmAzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOiSPXmI6u9sepOV6wooLMIfqDBs4PyEZQydlb4ZCQOfu/wkjuDib8E9a77ZDGamN5ypqPRtwGWB8r/tAGk6SiZCx56T90kxdOh6hwPITw370Zg9meTYvnh4yBVwwa0kGlBOzv1decKegNMdJjbXC05GBumirxqRwkvry4zaRLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=3Y4DHdeQ; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="3Y4DHdeQ"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6b0682d1b12so25534006d6.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Jun 2024 01:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718179383; x=1718784183; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZhvy6kkbKYCk5v6xkrBCIcY4DF51uW5QFIx01DmAzk=;
        b=3Y4DHdeQXtPkZ5hp70y6YIwp1yaSi3QMjJKn1BSGUxTdLUy5r7hty7Ih5ewK+K/rHy
         /Q8+gO03CrVScBzLNsz+wc919MfFLZbbReyRQKr6oXZE4m+TlG/o9yGaTlGoEVRlEGkd
         tdtaQf/tJEHK2qAhqgxulimP8CUWRTwIwUCDo+MwpkGcd8rkNR4rWkk8iFIIEKBFKd7V
         R9WsR9GFvg/lMnDa3t/WrQoPZZytJ/Eaufuu3WHxCUO5TqrJkf/tvESNQZR0ibVZuXlV
         BoNZ75jCj0yIbFL2SD1e73NE1szeH/TSDEomNI/pCt8+LPMNRJvm60jvkUB5Y+0NsQcC
         5FLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179383; x=1718784183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZhvy6kkbKYCk5v6xkrBCIcY4DF51uW5QFIx01DmAzk=;
        b=si840QpADJ9VzudQcmZDTKNqiDj5sZfi0OWZOAdms88vPw1+s3VE9Yqq4xcsekdewX
         vDEQjlPjyW0FH0RXFhSCgFSBsXxNU2N3xasy3dIri9s1GPQi8IwCByuSTIiRs/yAmxXp
         mXZCpzvYpChc9SCH/iECT2x2KVf5d6Y8ctrQaHtd6SPZoJKaxBELI0vyNfIujCm8iSAi
         jjm13V/5Tx5MuhxtNOc3+TWvTk23TIDsoHVWz+v8HvtgXzCQJy9xwVg1EkPnGUxbDUbB
         leUU7/Kf2Sc5gfXMTYBJ6gkAhrgoVpRpdJaQAIuUMNghxehpCsWdMHBlcV4Q9QfUt8Am
         Qpow==
X-Forwarded-Encrypted: i=1; AJvYcCWfKGFAw0ZnvsStp79M5LCxAPmPG08ZAxZ5f5VtPIaepOTvlX31pqHz4ELm6gS3ah9GcQYP8s6lRdPJmVM/HK4Z2CWETvvQsds2JLo=
X-Gm-Message-State: AOJu0YwVldIMq3MgtMBnx6UuJcRKKlV96bY4P+NM77ByTM5s2GBXhshy
	+PeZNKmE6Gw9hgibZ50NpzoS+olqLtolBmYSDyDi/HZHYc3sd3M8/VlzmvqTjC0wfoeI2EFRVmh
	FKCp31Rz++WeoGt+NDovquXCPoCrvICjvtGActQ==
X-Google-Smtp-Source: AGHT+IFBoGLGnRCfXUTT6MkmXv5tkb/vW4wlOs2DaIN1mKJ7KPlKywflPDae5tbSNQuiVC2G0raN2IzC+x3zhZJMYtQ=
X-Received: by 2002:a05:6214:4606:b0:6b0:77fb:8f16 with SMTP id
 6a1803df08f44-6b191778bdbmr10576316d6.21.1718179382867; Wed, 12 Jun 2024
 01:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240611094810.27475-2-piotr.wojtaszczyk@timesys.com> <1ea92ff0-7e2d-4a9f-bef4-d50fc93b86e6@kernel.org>
In-Reply-To: <1ea92ff0-7e2d-4a9f-bef4-d50fc93b86e6@kernel.org>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Wed, 12 Jun 2024 10:02:51 +0200
Message-ID: <CAG+cZ07jpi0dobjf8JYt263qqy1tYWAvzsV9cgKaAW05mBoCeQ@mail.gmail.com>
Subject: Re: [Patch v2 2/2] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, Chancel Liu <chancel.liu@nxp.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 12:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> I do not see my comment about DAI being addressed.
Were you asking if it's a DAI? yes it is.

--=20
Piotr Wojtaszczyk
Timesys
