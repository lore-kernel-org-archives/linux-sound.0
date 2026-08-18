Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C12375AB1
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 18:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787077464; cv=pass; b=obItaXNpT5RftP/1YgrXXNm6q0YTzto2PL9KKGDinu85mv3viw/UeaTbo7+JxsWeGDPLJTMiG9dQ4k+ss/XBXL1aAPtu1Ahsuq5dPSkdDQK7RqoYG9ik3w9LOO0bHCFI0Me+7h+VSsH6cUKCEaMVfjltDKSk0+y69tmMrud6dV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787077464; c=relaxed/simple;
	bh=CQ88hnsueq+srcqQdNVdM/3LRJsHgF2cfFzNhe2sBEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tF2i1dNaawZstPNQJvMOBR8Ao9OTQOsRn2C3otCQn73ROVx506ONRgV68ZqIXt0GOOsEboHb8DlsCU7vYBeyQhwn3oAiFcopLm6QJrZS4mggKv0W5U0ankJcUPPJjCssdjF1c42Dtd5DWEpsofMlc1MVK5h/LMWKOVrrliuTSe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwlwXij7; arc=pass smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwlwXij7"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-97bf8f94cb3so42199241.0
        for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 11:24:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787077462; cv=none;
        d=google.com; s=arc-20260327;
        b=F8U7UScaP5FNxgjyHtqIYOjV5vJVxH0P/bfaT9lp357qmhA3KzY+VDRRuk23kIioRr
         3b09UOwaRRIzXjrwUiSlG62wfBiOLTOwvXYyg6Nm+9E5z8g0KN52fHmNXLvTJ4cbz2UJ
         MlMJK8ZFa1klFnL1oq5rYcrARGRjcM9uMY7X4WGf036kM0OEDndjWleiYTnoJfiLzjlC
         yb+25uHpH8FJ5H/BK69BKAlMP4TRrsZFuzceWWXEReKn4+B6as1/OQd7Es7IuX9IxoJ/
         lRnXxOBNGqfAgou/6uRMCjtomYA2R09z3L/N7/kuJOlinSADMpKWpYcRYs4jTLGFaTM6
         8GmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CQ88hnsueq+srcqQdNVdM/3LRJsHgF2cfFzNhe2sBEs=;
        fh=8AnblPq9OnmKbkJO54dLa8ns3p6Xu/hhK1y/pqq7aTs=;
        b=saMafH08zygZlVkhWWWSEd4iLVx6wEI52PZdvt45bK2OS9B178PMWQci0w/y2NPBJV
         H4i3Dcs3MTY+Kr+ykHM16s2cz/s8wzUUFLY1hPM0vuMe9ho2ui/t7sVBLBIv1ZWUixzU
         RlANuBbpkj0P8/y/jvPD3M2MGbPMK9q9UmQda6c+gSJ5gOceKQKLytsS9aDj9xPHTuux
         yDGeOVu7zwHmLcmFRWP3GMzUssXvmrOC/vDZs2zQH7yH7W/M38NB/duUcAOlJDv6629h
         Sz68KZyLsthWt7RNZ5kaykLpGNK47QTo2W8PXpzlIpGNT6+Y2YI11KvDLniS8rFpyt1q
         Xa0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787077462; x=1787682262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CQ88hnsueq+srcqQdNVdM/3LRJsHgF2cfFzNhe2sBEs=;
        b=NwlwXij7MjIWYz9kso2svF6aG1SFC+/Nl1n7CAUnb6XWcOMUmoxHy1HQWrjLDPcFGA
         VFmlEUe1kgGdiHfOiorr10RFCKGf7fqNFr2rm3OdqmL9IAelRVAi5osmnuOMszdnQsNP
         cq5Y3iPslFDbqjngGwhD5xHbTS+6hzEhUmqOSjoUzGUTYxQ++atSNWVmkU6z88iE3Dyz
         8uie4rmpV7oS3IiEP1VdgbZUKOwqnA6qb2aXGX2BGm8815poEYGKvfAnBzVyFeutOtQq
         ePIEJv/dxPZScoUdGh2pOHJ3Gj4skTRuRJWrn9KayzsLKkXp5x8mmY+9s5eOSw2KJITq
         GT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787077462; x=1787682262;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQ88hnsueq+srcqQdNVdM/3LRJsHgF2cfFzNhe2sBEs=;
        b=Uqp/4/b9EA9Wz4IceTBnqQRxBS+SQuz8idaPCtr/cOIp0inoxE9ZzBMHsFsKxh3iyR
         UWbqAfLPvrSjA2QEIxMXAJlQJaGLsGGY03WjjgFLwhtZFs3tsReDx++gf5g92+U//hLJ
         i0hsdihc8d4REPoWpkxqdpGvqa4aH+rtu8XZ3LDUs7owf1N6uZzZvG4/bPmOOZ4G/9AO
         r7Uk/Sm2973v0RlCPy1tuD3sOoqnJ/Ys5xxzRoH/Doho8S8s84RpZh1O8KgX+3rTva1P
         mb39EpugTqtCcTsgInr6sJ9vosm/4psoJvJxsFUwLoTHOhWEgKVGpL/2fKxls6r9EFAo
         3Rww==
X-Forwarded-Encrypted: i=1; AHgh+Ro46ODvpBs9T/FIIYXftd317wsU8W2r0jfyoiLMGGj/lZG2eCqiVbLZIdM2s9tRRTIDbre5SCm+qV5XJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDBA53MtT29nAqHBFVX1oXCB433lIu1KCYP64Mmsq6oPpFIzOa
	Qcg3dE5dauykI4z6tOkxm+Dz5yc4Y4S3WvJ4YsAxDIAs25QomYoRM3tjG/SlfeEXpQWX0iu8lDF
	00EPQnLSR/Tkkm1wfHT1AmVbKi9xT6/c=
X-Gm-Gg: AR+sD131u9m5ecwV8Ba/mLWIshY5yib5b5DKRqfDmBPLP03XWOFdrHsefw2wkfAhWoz
	Zp7gVbJAsK7hqSrXPiF8B+RPSTUtMJzM+QMdL4brfLBY4nt1S4Q042ZzoFt1HiUR6khvCXNgnKg
	R2yQbJNmPuHoIIkOCs3n6aWazNkf711FNsVbvsM4mffAZjTGc8ih6MmmHXD87sGvLEzqKTFY+ER
	Rx2p7i4euFdPE3JfhxbLFsvThbYPneEkzkG2I5nPP8nFONDavmrWC5LoJt6Ne5UvAItQjjIhDFL
	rWbt0ZL7cTaTnbviywlhLMkxWl7SbfKo6TPWEzVKlXOmUhvaxhCD2C/2WC9SDq4a7zaIhN3tHH9
	n
X-Received: by 2002:a05:6102:4426:b0:631:4cd8:b6aa with SMTP id
 ada2fe7eead31-777b85eb3ebmr13238137.13.1787077462321; Tue, 18 Aug 2026
 11:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815182747.8913-1-excursively@gmail.com> <c75806b8-7dd1-4cac-b4ba-e457d8aacce4@sirena.org.uk>
 <CAHgGaxwrLQ3+gKSSxnOBYMYFRgcbQG9eHc6xy-i0DsKhVY7zTQ@mail.gmail.com> <67f89540-e9ae-484d-9c6a-817c5d88afdf@sirena.org.uk>
In-Reply-To: <67f89540-e9ae-484d-9c6a-817c5d88afdf@sirena.org.uk>
From: Sataporn Saijai <excursively@gmail.com>
Date: Wed, 19 Aug 2026 01:24:11 +0700
X-Gm-Features: AcwNN1VVIQf-cdsI_OYxgW4w6uRzeIlr-tawIGLor8O1z3ITCrg767ZhYohd-hA
Message-ID: <CAHgGaxxHU_zDtk4pe8uPRrdae01=UVQfn9hCF3mHOYi2PwPPUQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: add rt721_l3_rt1320_l3
To: Mark Brown <broonie@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 10:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:

> That's the general idea, and if a DMI quirk does the right thing that's
> going to be better.

Thank you
Dropping this, sent separately as:
https://lore.kernel.org/linux-sound/20260818182020.143096-1-excursively@gma=
il.com/
