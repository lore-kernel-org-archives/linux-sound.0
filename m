Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD82367B68;
	Thu, 30 Jul 2026 02:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785378285; cv=none; b=syzFH2ePLLB2uxsq41CXZ2FQfeUUgoYi/L9uku9PktK17CChvZlpcy9ZScI0bxZ8jk4NXln/WmMulimVH6wEnryPsS5aazQkUsdjzLFFleyYZAncbI8yNx6oRdHqJNJk4/9s74EYkXWLhwrjM0N+7s2LJiXOreKcVVhxh6nRYC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785378285; c=relaxed/simple;
	bh=faQGHyzsqOboMyGKSXdPzb5LA7GJgulr+Q/mJtOt/5I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Im4BEpImLUpoVNKlEhTm0nds9WWAAC/SePKnkoHdfYazUqA5c3kvggbt0p5hb6lQJaT3gL7NqJNG++mM03BNlhS0uOxF5gYK+UpmfH4/10Smt2tW0H9ydE6/t9sAeBrTQCB1Fv+F/u0B0CNnh380n65QbPxLt9tbvyJZYameT5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=R8hWTNgY; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="R8hWTNgY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1785378272; x=1785637472;
	bh=faQGHyzsqOboMyGKSXdPzb5LA7GJgulr+Q/mJtOt/5I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=R8hWTNgY4o5V2ugRjgcRGOiMxZyywm9BYcMOdu1w89fAw60rwk5WE29BANpwZb43F
	 +kfRMgQUjW5B4xQawbdm0ZVQx9rRekLiIdBd6VU/rWJAZglkXRg5jUpwMJP3LIRSd9
	 FaHwa1lxYYWe6sD7duAgVyVySi/x4fDlyKVhBNhfwT3/fYMXQdqRR4Oj9ABx5q8/0d
	 1xyxEesD1SikADLXTT6wKvRWx2aCnEk05aq/oK6UvFNHGnWxsXMrcgeQYLTU3oR8vJ
	 pCYoplnIdj8dxGmSF3j2Sa0XrSxDjItC4jKkrvxOaqPSTJfTo+WtXhXECrRn09BmPR
	 qjLD5/CnQyd6A==
Date: Thu, 30 Jul 2026 02:24:27 +0000
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: qcom: sc8280xp: Add support for SM8475
Message-ID: <32d3c172-8210-4553-8dad-9b1b5d7fee5b@proton.me>
In-Reply-To: <667133b5-10c9-4007-b5db-27e553dd5034@oss.qualcomm.com>
References: <20260729-sm8475-asoc-v1-0-3edad8aa7628@proton.me> <20260729-sm8475-asoc-v1-2-3edad8aa7628@proton.me> <667133b5-10c9-4007-b5db-27e553dd5034@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: bace4fb72e50feb96fc72ccd2cd4ea6d6bba9f26
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 7/29/26 7:11 PM, Srinivas Kandagatla wrote:
> Patch itself looks sane to me, but the commit log needs bit more love.
> Its too short and does not explain what this is platform is supporting.
>=20
>=20
> Once fixed.
>=20
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Will fix in v2, thanks.

Regards,
Esteban

