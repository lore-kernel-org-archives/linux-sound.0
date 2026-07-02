Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6456389106;
	Thu,  2 Jul 2026 06:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782975539; cv=none; b=pwVrqTsso4Y8vQ/NHqUwestOTLFeNM8pbw5cAEJIsLR6opPyu6h33kUDrRW15i9m95MBocUF9Zhgmb9SCWlGrXPBsz9tydQKKaUER9ew5+T2KxJF4PpuZL8e28G0fiVVFfceTgD8QexgVFMna/iS4thxefd5OZuU5oDMQ63o6d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782975539; c=relaxed/simple;
	bh=rq5W8rSIl+Gz16RqXA6zi24a2rNdkg9UdCH/cwwH2as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyvY95VkZUpl3iFEPSA6g3RwSupCaYbMEEgpMHbwZ4evuUjb8A1CQv2FAhz77Ak2whXGyD1wsfFk7xTLsirXQjR4WUpnfLcyot1QuMD6FhUa/mATWd2Y+JRom6/+VY48mLFMsXBPD91prU8WyQI973i7XwY9C7O+2zscBMgoVOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oI1qf2pQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oI1qf2pQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC511F000E9;
	Thu,  2 Jul 2026 06:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782975538;
	bh=rq5W8rSIl+Gz16RqXA6zi24a2rNdkg9UdCH/cwwH2as=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oI1qf2pQxP2rFjTnBsCN99rkaWHNeXmouY7w79bmfTC5N+n0tDUhBawYxFGlK9MVz
	 giQzuEYqsLSH0x9GahGwshXlSVZKV4RyalEhOnBN2sBFNX+bYyV+uQj251wPe8ghMe
	 xyOFE5aobPVxKPtzL1EAU+LTkyo9BKQdUXlgAEbMB1skQiwy5Htw504jevkk1PpOBQ
	 nTmxczodudbrLOJjIAigu8C6VHNaoUVQZRlLwtL0FA5DmH/3wc15AmyDGEcGbn4tTB
	 z9vsfv9oB2YDLtZ7JinI5axOpN4SWmbjsygTV9k8j1GdvQkwEAY+d6BENvexT7Yb/k
	 3wH6+GljiPjlA==
Date: Thu, 2 Jul 2026 08:58:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] ASoC: qcom: Add QAIF driver for Shikra audio
 platform
Message-ID: <20260702-acrid-shark-of-endurance-0754ef@quoll>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>

On Wed, Jul 01, 2026 at 04:27:46PM +0530, Harendra Gautam wrote:
> This series introduces the Qualcomm Audio Interface (QAIF) driver for
> the Shikra audio platform.

This wasn't ever reviewed internally (I checked).

Please do not send next version before you get:
1. Internal toolset checks
2. Basic internal review on internal mailing list

You repeat somehow standard mistakes which any reviewer would point out.
If your team cannot briefly review it internally to avoid simple
mistakes, then please tell them that it is a requirement and I will be
NAKing the patchset without reading it, till they do that brief/basic
review.

Best regards,
Krzysztof

