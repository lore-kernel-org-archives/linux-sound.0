Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F1C2701CC
	for <linux-sound@vger.kernel.org>; Fri,  4 Jul 2025 07:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613539; cv=none; b=ojSBTLbvO647/+B33oaBEckLqumMVF7ASSKw8oVXAkZMtOva3Ok3Yw56LR7hZg4RveM/TsbPWfvAQB/l8dG24N8Mrf/rT/yx/+YVmaCppzKWx3e1Wbfx5oR4Yvw1MLP+bjwC/iRJ2K1m/OpIs1pyyUHfO13yn5hHiDTzPryZzGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613539; c=relaxed/simple;
	bh=UcHF3TjBqRux/88Tho98NKiNY0aNVil9tUeI0/ZZlA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSlLFSaMpPRtfrlo1QKENjAyPMTBcrbIjpxLBLEo1uqLxSxevF/Cvzx1UEuerhi4lqt0hujlg3Vi4FwtPsTAclnRQeMiSJXmutgqiJWaNeyRqLQpPjsegH0L5ilb2mmdPdHq5y7PnaU9jCwYneHAE+iJ3Uz2Xe6+QTqezL16bZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com; spf=none smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foursemi.com
X-QQ-mid: esmtpgz16t1751613527t9b4c4649
X-QQ-Originating-IP: sqjpDicPwX9V5zrS+U+79QAgeN+fW6ZtIOV9Dvj7kd8=
Received: from localhost ( [183.17.231.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 04 Jul 2025 15:18:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14648494132943919214
EX-QQ-RecipientCnt: 13
Date: Fri, 4 Jul 2025 15:18:45 +0800
From: Nick Li <nick.li@foursemi.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
	tiwai@suse.com, xiaoming.yang@foursemi.com,
	danyang.zheng@foursemi.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] ASoC: dt-bindings: Add dt bindings for FS2104/5S
 audio amplifiers
Message-ID: <958EB912F5B1E1BE+aGeAVcfUR_Uq_9Ct@foursemi.com>
References: <20250703035639.7252-1-nick.li@foursemi.com>
 <20250703035639.7252-4-nick.li@foursemi.com>
 <20250703-primitive-puzzling-toucanet-2c4870@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250703-primitive-puzzling-toucanet-2c4870@krzk-bin>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OLsBWtCIHsg66bDpXwoiQ7EUYJCcEiSWPeTTCRGuJLbQPIvy0+3id57B
	9+9ymHIchhcrDNJBCV8Ggm7vyXPHdA3SiAwXZghxmy7zmtWkPsH+Qas1ouBbs1JSQdhMsMm
	G59eAlYXT6eEBoC2IhAExceCPsqZROmywCimNnWUDfdDRggYHu1FhupyModRHNqTcBKhu3P
	vnUnwlXppAKAFwzq11yyiIMm4QAxedTJCf5OmlIVWCU6ecFp36RMjJCM4PR7Q6mj7p0CRVz
	xfpyIdRJwBy4SQUEOUvoVw4bJ19XvHNSOj6IXlZPJGJgug8eJ4uNWSxEH+I/cmfQ+PDjasY
	oon+ebx8huB0AjvUe7YWVtdlcLzzRkyRCznFy3n5zVj5xpYK6kQF2SuOSK3k155egZRogFJ
	jrmWohDu5x76wrCRd1JZ15qI0V6IhXPy1aLIuDzsKB7Z5sRnu83gaPqwy6tdNo9K4yIon+U
	dQJZZkAne7Ak3WmZhtmbvu3J1tWpBdSv/7QaqI4Gw8nIKFUTy7U+ooJU1FmQdTVi7ydPEi0
	odQ+v8a5CbfVb7F0soiA9FX/Rs/BHC8C+33L6BtcHmeA/X3f1/5lbtVveCAhSOertHMl260
	ZtNSD030S8G/zQ5Tjusg3VT73OwxBUIJNupD0w0yUcgKivfEcQHts4qCpAJMB+X90na7iYk
	eUduCJ9VPUJMo49kquUTkEVZnlaFKkDuhiKWACJXiVdmMsNWywmDcHldzFkadfx5B8T9bSp
	aHJWtyZLsRAwFzwFsaSGQOFO5FIAD7BMr00Xc4QxCAV1tUE8bGQkQvQyxk/FbIVW0uW2mpl
	XTmzq6/b51xJmVDxayZNxZ6vf7BbH7PuErCVmCVcMnz5Hoi6Aat8YqaQvSzdWwgBvDjxtkk
	k/tSiFDexYsXfByBnHGYoNc6UnNaa7m8PmtCL+u8PGtXMXMje/SkMWggYJPMhiYArwTkTwt
	b12qdWqxfpCH9gKb0aU6OgVus5fvFId84FJ1zBqqNuzL9aQblAFoNgMMxjiY0hU6DYYcDCt
	O2GCAmdYLOFu16Or/5sX2tvU+/Exj696ST8LbYqq1g7D7QY5aWr4fiSrNjzHU8Oeiitkh/R
	w==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

On Thu, Jul 03, 2025 at 09:10:38AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 03, 2025 at 11:56:38AM +0800, Nick wrote:
> > From: Nick Li <nick.li@foursemi.com>
> > 
> > This patch adds bindings for FourSemi FS2104/5S audio amplifiers
> > which can support both I2S and I2C interface.
> > 
> > Signed-off-by: Nick Li <nick.li@foursemi.com>
> > ---
> >  .../bindings/sound/foursemi,fs210x.yaml       | 95 +++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> > new file mode 100644
> > index 000000000..3a1aba9b8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> > @@ -0,0 +1,95 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.

OK, I will check the patches with option --strict, and fix the warnings/errors
in next version.

Thanks.

Best regards,
Nick

> 
> Best regards,
> Krzysztof
> 
> 
