Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB7A3E9597;
	Tue, 10 Mar 2026 07:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128701; cv=none; b=QPNozWTZXjtzsamxztoDA/uatytIIbZMI1+i+MC3pic7oaQ2SFtxdPVfjwTQfOKJYTzQ6OyLplIFn+wCxlQ3FY1tGSfvIwwYd39t9d69fQubmFNCn5w4etFaZmKNaHIlvinRKEGwekA+JbCbybQixPdmzduLP/r/ing1VUTDPv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128701; c=relaxed/simple;
	bh=14+B0q+DaWJW6o/my67KajMAOoHWePmWrNJ2DJQL25Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZT7DNRAjcNPCHIC96w9ajYYJm2OqpPsnd0T8TQ/SGHI6vZFnpbPKsjxjrMgqz1YglV5/I4PPXoL7cjZBjj+n1pPX3LpI3URIroiUbNIqnzQVSkTdpIPwS8B27FSzRWC6U7Bzj/Eq2GO/rNi4WGODHI8oBTIread61+1ziGQIGQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFub48VZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFub48VZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331D9C19423;
	Tue, 10 Mar 2026 07:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773128700;
	bh=14+B0q+DaWJW6o/my67KajMAOoHWePmWrNJ2DJQL25Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DFub48VZxJtW6ZkNuY8VeArYfRckDC1hK+/nxqo02IIvLe+8uYE5F4+H/fEgL5Tzv
	 ksNyZOSsdg4fRsrQ0l+yH5jZLSfcbavPtjkODJszrX5r4SSWnTYsqwoJp/OcX2tz5i
	 14kdDiNOuBjZBPXF2u59Tbqt9cVpDUeFMfpxR0M2pqfMNL8UrUMnpkHGek9VeM0jTm
	 SQ5eQxY05gJiffmGc2VrR4fbBJxH5BLQLlEHvNqHW4Ct/t/VirXKahbd//pvxctXI5
	 9qFhfsrdOGzWhIuJMZKoLukm1SC3PJq2nGWuZvsW2RhS1dfuFhWw+96B3YFGBKCgiA
	 UxywlRMwgAP5w==
Date: Tue, 10 Mar 2026 08:44:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mohammad.rafi.shaik@oss.qualcomm.com, 
	linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mailingradian@gmail.com
Subject: Re: [PATCH v5 06/13] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai
 ids
Message-ID: <20260310-new-artichoke-asp-6b5412@quoll>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260309065137.949053-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309065137.949053-7-srinivas.kandagatla@oss.qualcomm.com>

On Mon, Mar 09, 2026 at 06:51:30AM +0000, Srinivas Kandagatla wrote:
> Add new dai ids entries for LPASS LPI MI2S and SENARY MI2S audio lines.
> 
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,q6dsp-lpass-ports.yaml       |  5 ++++-
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h   | 12 ++++++++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

