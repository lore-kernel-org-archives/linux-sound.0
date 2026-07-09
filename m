Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF6D3DB318
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 07:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783580826; cv=none; b=SXIz6GZ16DtOrvEt+dmT1NczS1eR8t6lC+z0ij5YIBTtdoDHrGymPvhmmZYXBx0KPcSRN7L+9fKGEKiAVvI1B3ZQxil5xjl8D2RuU8HrPm7uqeoUX8Uqy7OsfB5PDlxsG/U4maN8b8Kw/nrKfcQCGlqNgDO9ka5/bFZALVHhHyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783580826; c=relaxed/simple;
	bh=Bnd/Zp3niZIQob/FNfLgwtO3XTUE9bxrb51tY42Yjss=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fJeP8lZrp5Hq9vq3Jgt9EPFJmCWGuBd8E9svOHv70CFLZ/8I9Gyxb9uJmgLmOnms/hf06DcJP6w/IcG9WRbJzvbUJgRXoPB+3OMAtJsIewHiSCXVH804ZMN+jvDMZi9bs2kNrOr+moAz/pl2LM4rFadDOqczRbnFPZCeT3h+loM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=gLsp7Dd1; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="gLsp7Dd1"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso2756985a12.3
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 00:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783580820; x=1784185620; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=39wxSflXcaAuLOW85LSK1MzZPDJ4dD+cTINLmzJuWNw=;
        b=gLsp7Dd1WVvvxNVzg0TEshjZfYeaBtgcq8CTqXXbwUOJd7r8Qtb+oP9eCA/LzinkrT
         /ueUwtkfdbEZT3eRvolfn182weA34O2dMkA/8QNSaiwQ4Oos0CsAqs/uaoDPXGSue2QE
         sE5Iau+Am+lLQ2kJj54eDIkSdJew+WpHDO/bFtybnWU8S5C5Ll0s2trL+ntKRvcgEh8w
         iZ3SzhmzPVaxidRhAA4aPtwzhpMwE9IN2w0nnyx/NvkFN2EJnQnoMpPmNN4iNn4O9vdp
         hiQf0djgmMURAn5qc1tsFRlkv2rSEDq213wtVSbXULMU4+y2n+0u/CWfJ+4MEFiq2Pvd
         Kdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783580820; x=1784185620;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=39wxSflXcaAuLOW85LSK1MzZPDJ4dD+cTINLmzJuWNw=;
        b=BCR8eUUBLFJgitVJc47sROZnzp0A9MOUrWqlITW+QV4C/FBVoxApHmePBnJ+3269P8
         L2coLRX0yr6k9LlF0yyHUZg+O+iY7zK+zknFCJvHnOsfXiV0OnLs7dRcn93dtLhqwKv7
         J7S7DlDe7x/TCKXFxRcsqZB7P4yA4ezSTthZTyljrdRxtuKB7rd78175pOcg8C37igt3
         rmxPSt8pmTZwHh9GGPEnV+/eSmgD2sDSFiGKtfuMHtcUuoCdCfOsZHkFUgLTja54ox8T
         L4dO1BNMu4dZesO0F4SgBumVNZB3qwiiJbOdpT3D0yakGvs6w8DI0tnE7Y2+yD+/2kal
         ACSg==
X-Forwarded-Encrypted: i=1; AHgh+RqhadnyHFpvHHwGNDmcu7ughcPeiR5ixu0I+LkaSy+qUwh3gxxkl5WnkCozoXdR7O5uGYF593RbgP1krw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ/Wvq1ZHGRyD3p6wxornOwg6Q2PoRonHVDMunKOIbsN7h/sDi
	jqBiLUXkdCbCNG9NukLxAm11kz2bBfqfWg68Yj/5A75j6G06ia6q5mXwXPBtx72KM0w=
X-Gm-Gg: AfdE7ck/cVEWrgEYm/sloTynRH3guXEroHVyz3RD1IC3jItj/Ub5f3T8R93C/lDKPWF
	iMe5rzJkkv1rdexji4bloE8q0b/C9VZjb35R9xbjNBUMRXhgUT54M+fcG48fKf3u4eG8GJIb9r0
	p6pKwk+jiCe/E4gHJB7JfkED8YckYqEM4N5cKRkPMRCS5/kpQ4I3MeQ/rvXlATFj+2s4MfHFJRP
	WTJroGPVtTVDP+CunekaD/mG34aHWqJ544yfDNmrXnZIl+JEqBIPtCj2Si/y51773ozZV3wDvox
	T0Nkqi+Gnik9cCcCvr0c3LqOtqJFCzOvra2WNwA7uqJnJ2nQUx3JBw34qGSVe+VURmN5gkGdszR
	SzuLY6NxX96xS03CEkF4O73GRNdgt9aPdGDaAUgLspGWOmcG7oy4MUknArMi5MuPQed7vXBRf7v
	gUg7QaXVoi3KXRxzxsl9ViXvGgu0vVM8HsUD0lZph3SlKhMw8FUfR1DOD1FQ==
X-Received: by 2002:a17:907:3f86:b0:c15:d0b6:495c with SMTP id a640c23a62f3a-c15d0b64ce5mr261020666b.29.1783580818201;
        Thu, 09 Jul 2026 00:06:58 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ca1bd81asm240667266b.30.2026.07.09.00.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 00:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 09:06:56 +0200
Message-Id: <DJTUMRRV8K1A.3AL1AMOF242DP@fairphone.com>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 1/2] ASoC: codecs: lpass-tx-macro: Use correct
 config for sc7280
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
 <20260526-sc7280-tx-macro-v1-1-1aad6900fec0@fairphone.com>
 <4rd4l5ioccdiggvlwl623qsdoy2udy5cr6sigyxrg5pbdll37g@sboebzvzlr6m>
In-Reply-To: <4rd4l5ioccdiggvlwl623qsdoy2udy5cr6sigyxrg5pbdll37g@sboebzvzlr6m>

Hi Dmitry,

On Sat Jul 4, 2026 at 1:55 AM CEST, Dmitry Baryshkov wrote:
> On Tue, May 26, 2026 at 05:29:54PM +0200, Luca Weiss wrote:
>> With the v9 data, the controls will have completely wrong names and
>> using wrong code paths that do not apply to v9.4.
>>=20
>> Note, that this will change control names so it's a breaking change.
>
> Is it something that we want to keep as compatible for the old DTs? Or
> is it completely broken and unusable?

It's definitely not completely broken since a good number of devices
work (seemingly) correctly with it.

I also tried and I could make the microphone on Fairphone 5 (QCM6490,
Elite audio) work even with the "wrong" v9.0 config, by updating the
control names to the v9 names instead of the correct v9.4 names.

In the cover letter I've expanded more on this and the possible options
I see.

Regards
Luca

>
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  sound/soc/codecs/lpass-tx-macro.c | 9 ++-------
>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>=20

