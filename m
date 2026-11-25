Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604489;
	b=SpW8XcU/IpBuBLJ28Z4/Hb212Qy7uQzt3IdDzofcJ0rFGMViVp+pqOL+ol1nkOezbL8G
	 DWaEfo9vP4h5NXujxLQ9q5T+zFbwsdfIUmlh7X145F4xhX9hc/tH/7MQEPF0H6egCL/7a
	 w2tkoIb91W4BkhNrSg05QkPVse81nrvjX1gQHErzBh7Jn1PVmpTsBxvwQpgIgbU9vRiUY
	 EoHDWb8LuwylH9sVP6DXTMT5Qeuakl5n7E4qZ49Mvqsz1HWNquRIrEDvnknsqgPdDZjOk
	 3Y5Mg4R9qbJ7qtGIYWQPnZcnil49di3AnF9ks98ykeUuyNEmHH7R7RQlUfIp6hkF8aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604489;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ls/XKRhSDqImoSDA8Avtgm58LLODMHHCGX8otzvr3l0=;
	b=Q2kMqKtFGZpT6CJMl2sLYayvvjNAHp4hlWcD/iD2D3BUAkwY9KglnuPQ1+RVU2XQZqRR
	 xjODn3S57Svo71W9w0RZ0FtQNpPcJRDv8VV3V5GHxgkCIryr2W98Z82QlKm/vtJFOUH7N
	 w0Sx/fU/4X302XTMa92AUV3MSvowQx5smPSnHSxHI4Za9y8NaxB4qbdFRGwhh/znWshp1
	 brqSD7aVZ6U3VMAN+RqcbLu9Oi0P9BGQsCUmE2bkhQxlAmhK+JeSbKWhc3D/NnPRg8gO7
	 IlIST8rUF0Cv4CjCYznIBLtU4y1sTxMhVaRQZwtQmuIvxnrcMI6exHF6Gz08c2W1pdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UMKuurI6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57BC606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 11:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UMKuurI6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC2F1F000CA;
	Wed, 25 Nov 2026 11:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795604489;
	bh=ls/XKRhSDqImoSDA8Avtgm58LLODMHHCGX8otzvr3l0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UMKuurI6zCoEwfRhXmmmETw4hvlz5NLaQdsm2dIJhHBoxf0bwzPim287NVA9C9Bkr
	 WEQH/ok1nOOBV8IBgXLJqlAbgwNnm4vAuazWaB/W5ZKfplQYq9/x3eFIi4SX66IQdE
	 oQnLg0cpMFKWkMFoG9oX2pgCCffnsBtFq0nz/ukRfTjGsEvgwq1c9cSAuHTlR1sWif
	 em/fuRmj2E/bkbQbtS796nlt3vqlMz+ZeDGrxMrMZrjSV0gMERevwBI8cHtzCNxW1l
	 pG+TT7dLA4D/ILg4z0wzJjCNMCBmooScVnhsURPM1RwPh9eHIBMmyEOSwZBPUcPNw6
	 jKC+KdzkiiAow==
Message-ID: <sashiko-outbox-233186@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] soundwire: qcom: skip offset2 write when unset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261125103825.936939-3-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125103825.936939-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261125103825.936939-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 11:01:28 +0000
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
- [Low] soundwire: qcom: inaccurate Fixes tag and stray cherry-pick line
--

commit a8809d3702c2245266df6ea0d292d958482e7c89
Author: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

> soundwire: qcom: skip offset2 write when unset
>
> qcom_swrm_transport_params() writes offset2 into the port control
> register even when the port does not use it. Many DTs mark such ports
> with 0xff (SWR_INVALID_PARAM) in qcom,ports-offset2, which is then
> programmed as an offset of 255.
>
> Skip the field when it is unset, like the other optional fields.
>
> Fixes: 02efb49aa805 ("soundwire: qcom: add support for SoundWire controll=
er")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> (cherry picked from commit 65aca3ef0d1fb2f6b20892f0d1a3a1ef391ccf7f)

[Severity: Low]
SWR_INVALID_PARAM (0xff) and the checks for optional transport parameters
were added in 128eaf937adb ("soundwire: qcom: add support to missing
transport params"), which left pcfg->off2 unguarded.  Should the Fixes:
tag reference that commit instead:

  Fixes: 128eaf937adb ("soundwire: qcom: add support to missing transport p=
arams")

The "(cherry picked from commit ...)" line at the end also references a
commit SHA that is not in the upstream tree and should be dropped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125103825.9369=
39-1-srinivas.kandagatla@oss.qualcomm.com?part=3D2
