Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792691585;
	b=ZnrThDAK1m4tNrbepKCzbfc4Rem2mGwlAjqclL3qBRA6X5IwR2fXJajPOv+YAaGq+pCU
	 Io5soiufhBR6/t+9EZkw1hJDIAAXCuEEVs8I0VL2z2U2wbphxt7vywDpqkjWryuRLZd6H
	 H+EWCw+HdJufLIW5kstMNcXNcpPqzw3WxO2PElTUyrfLS3MnQLrj08VFw+7V2Kgw2hwfQ
	 +eUTn2mHM1jeaZ2ANV4VGrOJ5Tu0pMv13Lf4NsxTeaS2c8pt6YPU0viGOIbwL0F9G1xRG
	 M+WMRFa2WTPiBjCgmjTZs4K4enrYpGPqkw+oE28wOejxw3fVdN3TdNW1oJdU+YLYuMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3caCbj25DMKEJr+iPP66wR6DUJgaEfAKCjBL8Q8RuKs=;
	b=bKAYdYUGYZs34WtXmwmFWX4RnYiAeRTBzSmxl7Z8ztUMXDHwC+XY7hfuMSWbIe1GYKfy
	 gxnWrbEekCqq7SDWd/85bNsDYo91O00X5poLuqTsqaOT48xG8+22iZj5t9p+fIii5Dd62
	 6VwVjr2tEosIn+h6os8Rv2+3+Iv9ufZtq7F2dUpMBkKv8hUZfFR4n6thzjHaS12x2LZZ0
	 MO0EWl3577ZnqB81caUUcwy44FwrFt403AIIO3w/6zVPBF+90Rlbo9vqnMBS2mqduXgnH
	 5yZ884yNR5AQEoKZVcyrT1rN2ing7ptYpOuS/sd3ekmmGvl9qZRwysvVw9MPvHLH76Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CdWRFVVR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA58606A31A
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 17:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EA58606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CdWRFVVR
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35829219da8so1345454eec.0
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 10:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792691584; cv=none;
        d=google.com; s=arc-20260327;
        b=cyhsfvgU3y6blkE3RTYHdvIq2vzsNrahxP4FA2FJniUXqjs26KjBBDOsU2cwHMfPf4
         Tiv4HzStw7AIZ4Osm1efVKFibRtTyJ0A5LdEUXZMKK1MrS826bigkxUqrR382l1YOO3x
         Eu6xsEnuVIhNYJB5Ns0Do9qi/dDHlKX91ZImC/YKTicDInZSEilNX4VyKHuXwfOweASH
         DJQMpFsItKWcXm5SgXyotD8gDZzKmFeNBq5zbp/3vWPNCXWmHlY/VhSAXb5sLxfycqzz
         6er1Fbkhy2Q/XOiFP0CiACiqTPOUq2Hrjn2+4IOmKbxuMatJ7ClMzf9R0jXP0aD905h7
         XUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3caCbj25DMKEJr+iPP66wR6DUJgaEfAKCjBL8Q8RuKs=;
        fh=JVcyX1EJTUY4pjg9AVEft9hklLNBWOvLnBcsVAj4L2E=;
        b=J3yILAP0D1WoNRdiYucKT9+o6gyKi0wXHOGnMecNfM6Jn6c+vX/VoRCKEdFZwWWRCt
         uzea8H0FuGLH5sqgRLyKhsF20kfjuJFdlrrjkUvZpeVYV6lacOrGhmc9rqxvXIWbHhCi
         EoO5IDvTpC6JzH92DfhsQXalTS+2yoGiQ3HNOD/CQoyVfoHRyAnr7Yj8XmOY3lIu0jXi
         /qinOEqZMy04oQwRomI4h0/I5Kj/mR/cUwS5THp2zMYdhxhzrWhFDRRAPWvbkBxepaTn
         s/LcYo0nMExlqQZZ6yGtwNo2ufJDaEzgiNDK1cqsTAgT+VbV5q0KQVAHn4D8nmdMpRxW
         YOrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792691584; x=1793296384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3caCbj25DMKEJr+iPP66wR6DUJgaEfAKCjBL8Q8RuKs=;
        b=CdWRFVVRQFA7nUIEbW9/tuJ4GmATopKWcFmos2aLIz3VeptOn8kVZBD1BAB0fOT5ti
         iH2TdABNtqgWFySel6gPxtwrMOUDidEbyaIWboNu3OWXv2xFwD2l65i1ZRPbb81GTRNk
         7cwzieID3NXpEioeJiX2lh15lDBWOycH3jFXVZuBdOZB3BWFLdfINCnxJgob/hpFPx+v
         N8AJMVFlDMH6aMCcHJXW2au0INS95a1s8MAiYvFXIAqnwbNiNQpFd+gzIEONWen23FBv
         NEbhhdP68Wz/JBqcjICoTozj1zQKg8BF3eyJym3D99zB3Wwg6gK7lK2ZZpZsCIDkYJYG
         wliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691584; x=1793296384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3caCbj25DMKEJr+iPP66wR6DUJgaEfAKCjBL8Q8RuKs=;
        b=QqqKkg7tKRgY/WvtzuiJKTkHl4mehTJxeS1RzIMsAelMjW1n3lVk4elMFG0E1O+iKz
         sriVeJOF2jYsgx46dQYtK1x6/NPp1Z8oB5HeJepYxtHpnyfLhw1mHKqGP+E52fX33dsg
         5J5swWDwv2RKq/g1nPQG5R5n7rGHwIdUqkWPFMAuPi6kclOAvCBiKGJNSUixhtMoz4O0
         UH4P7mTWSXnWk3xYC6kg4yIOyM0LFNRsoDtP2f7dMfgDdR97c73waWsEJfYlqVTbSr1A
         7RrAartAq35m2rOc8FBXsbgiQmXGOMh77F1PpIZy15UoEcCZ9NG4SrdCWlAoxJnw1eEj
         h8qg==
X-Forwarded-Encrypted: i=1; AKwUvBxkTPdoXagUwVyQa+D2YVwU/9dc2mm0VZH5PtaJuNDGXiYtJWJSzxkTHYyl7oiZFY6xnmnJu6oiUajJ9Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIP1zeux7nMvCuEdI/pA6akj8H/ZUBHxTPE2roaIC7XxSwcTOTf
	O+8JRJx6qXmi/JkaoNdoy5xsjORleKA6toha1rlBF4egbGdhA13nf366ZyiYjb4O4N27TK3QqZV
	1lSQFz8DjWXBlaipDF6CwK55mmg8c9vo=
X-Gm-Gg: AYBFou2Q8vOKnFDvtZKm+94xQqw8ZhM/NYjqYW0WSCISOt5kWBGNeoe/j+nrhPqDXed
	mRXNX4OdnBWPT1CeIynnbygIk+On+VRHTcRSavhkU0B9t7EcsmRCr23a+u1LvA+7BCcOs5GMdCS
	xUEV1P5K0UNxo02IbRV/G54T3+5uBq5YtCQjPeIlg+uXWrp/2SZstcA4SDpI8s4qftoPWKPE0wb
	bkAmvOGYTxJc20LVQWMyXYnkZEmStMP6rHPD2IL2/FbLv4qOqZYgbtYN6qulCezNymrttuND3Xw
	sODzfunseJFSmpijna4wwWYssNbHX+TRSnO0F0u9yoDelaZf1EhzYVspaQRrPPIGhHGcA863EbK
	0C/Doqo8bZ7SkHoLnQr0neqFip3AWM0YH3EC/X9foc/ndpZmuhLWs4kuXBS6PnTlrtqq/0jk=
X-Received: by 2002:a05:7023:d08:b0:190:716:4822 with SMTP id
 a92af1059eb24-19599bd3be6mr253220c88.8.1792691584483; Thu, 22 Oct 2026
 10:53:04 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015130628.184279-1-clamor95@gmail.com> <d3648f08-17b2-4a90-8c23-3036cf71f1e1@sirena.org.uk>
In-Reply-To: <d3648f08-17b2-4a90-8c23-3036cf71f1e1@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 22 Oct 2026 20:52:52 +0300
X-Gm-Features: AclHuK804zMlj-QH-mnS-Z0lN9YQ0e8iLQ84s-klji9qX-wEVgx75tAGWTn5j64
Message-ID: <CAPVz0n3goYTds2oVExJUwNcOr4kHAHUntCt0yHMueOnJ3GxCGQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] ASoC: dt-bindings: nvidia,tegra-audio: Consolidate
 all codec support into a single schema
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:0=
9 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Oct 15, 2026 at 04:06:27PM +0300, Svyatoslav Ryhel wrote:
> > The number of codecs supported by the NVIDIA Tegra audio complex is
> > increasing, which leads to an increasing number of bindings with minima=
l
> > changes. The main differences between codecs are the compatible strings
> > and possible pin configurations. With the introduction of auxiliary
> > devices, a definitive description of possible pin configurations become=
s
> > nearly impossible.
>
> Please don't send cover letters for single patches, if there is anything
> that needs saying put it in the changelog of the patch or after the ---
> if it's administrative stuff.  This reduces mail volume and ensures that
> any important information is recorded in the changelog rather than being
> lost.

Hello Mark!

Just FYI, this commit should be applicable to the current next since
it was made on top of the recently merged Tegra ASoC schema for
wm8994.

Best regards,
Svyatoslav R.
