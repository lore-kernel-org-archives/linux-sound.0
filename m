Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968842;
	b=nHI+d+FyRrPfNgXjWlyVPzrPeBlpB+5LsHXV9RZy016pdDH4zxOr4gky0p6XgU6Foeug
	 tOWBfoeNSP6F5BfER/S4tVTp5VynMFi2dc4mpwHRjR5WJ3ooG+xDxLCS0vkfUjLojUjyq
	 kWrsvjls6c0hoCD9SKm17p6RExkKOYA6Bb13J/tqRjKkW2f2wS09GTdmCDJJzakOlje+7
	 I3wRP9s7C+7VM/2k+XHFmm2NP/npoZ7+AHr9wkF+O3a1FC4Y8Fe4sLLqbKX04d1B8OcqW
	 55wrEcfhPhIbh5QQTvNyVjajnpy+lcooCGOCAiTAiZJSz2rv/ChJaocxhWCAGf068mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968842;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+3MHBrxJ4/VoOmDvAaBqPv4h+bPAqjJGExkdpSEeysI=;
	b=HVbNdw6Jr5EDDrohcPBzQOALmqqYQH0PmXUBY+1ovjpUPvVLVl7eOrxA+boD92APImG+
	 0zYFe4j5jI1nMWDFzOEcIFVPuxEoCe/NZVfUyLtCQSFWcbz7j1U+3CeiWntArDvsSbQOc
	 E0NS7siQLeDpPhS1Wcn1rTkzFrF/5hjpGWmxfm2x5tlOzZMG1y/XXzR2oG1c5rMElTv3U
	 WkS9XHSZ6GLbMQ50W6i/eMuFh+xN/khk9Y3OW2oN/yVx0F49IHrO5ABxOvz8A3tc8dqx1
	 Iao/MSKKTDLzfS8/HydzAWpnR9+AwACRungNSAjyvw6r0OWZFSm/VuikGtMW0Lk6agg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lqhciphU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21BE606A33A;
	Fri,  6 Nov 2026 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lqhciphU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110391F008A2;
	Fri,  6 Nov 2026 12:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793968842;
	bh=+3MHBrxJ4/VoOmDvAaBqPv4h+bPAqjJGExkdpSEeysI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lqhciphUXl58hNNnFaDzTQ12YhiIf6n6jQ4V9kRJYJC6qyIyhfd7lNUFDT1MsG1DO
	 dbMPQXRa5MTb6Mk/Mp/Nm1d68RK3+0IbopUHj0nWElesqwGlT2uvnZKb08dFS7yTEa
	 iL7zpxtlmWN1v7a6B9JnL9gZ4o2MAMlp8G1rc7UwNQyR6xXHJL1VwVBlLQumKy8nk3
	 4mfUA2ux2OR5w5V2i/iZ6V5r2CVHnvwE1VRlNaAoI9m06X+hN5g+uxsaiBRUqCpgEj
	 bxCggXRqocShaard0fCW0c5B1PUne5ZfoJHWdMfbHDn9f+7H7c7oiEgz0AW46LefvN
	 2JERYNbCvpiKg==
Message-ID: <sashiko-outbox-201405@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 v6 2/9] ASoC: qcom: lpass-macro-common: Add missing
 v2.9 version string
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-add_shikra_support-v6-2-2cda302237cc@oss.qualcomm.com>
References: <20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com>
 <20261106-add_shikra_support-v6-2-2cda302237cc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 12:40:41 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ASoC: qcom: lpass-macro-common: missing Fixes trailer for v2.9
  string
--

commit cb9c3ae098725662c8323a4ed04c2faa5c0adf40
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

> ASoC: qcom: lpass-macro-common: Add missing v2.9 version string
>
> LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
> lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
> learned about it, so the probe log reports "LPASS Codec Version NA" on
> those parts.
>
> Add the missing case.
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

[Severity: Low]
LPASS_CODEC_VERSION_2_9 and its detection in va_macro_set_lpass_codec_versi=
on()
were added in c73e2c5672da ("ASoC: codecs: lpass-macro: add Codec version 2=
.9")
without updating lpass_macro_get_codec_version_string().  Should this inclu=
de:

  Fixes: c73e2c5672da ("ASoC: codecs: lpass-macro: add Codec version 2.9")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-add_shikra=
_support-v6-0-2cda302237cc@oss.qualcomm.com?part=3D2
