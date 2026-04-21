Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEF53806DD;
	Tue, 21 Apr 2026 08:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776759581; cv=none; b=egkjJC+zwM2UOEIGtj0WFdEAR3nC/WMxhPeJY3L28Qr2/0jjd87GKJi/akQdKE5kSXIye86aLY56gsc8nxcmpCGjGhuvDOnnbeGJ52AHwrclUgraR4tCC1WZp4JpHKNZgGlTAKtDlhvKG/4SRY9bJ5ZgaVzBjUCvjyewlbGOimw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776759581; c=relaxed/simple;
	bh=x3FLqMOzm01h7XoAdDrip3GVnx8vRPi8aOzgEXce4/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u2FpCOIoSoeyE8oLnX1k02S518O/0ZZBWrXv6SNwiYyXBlGQNOdYZigayBP7mmWrDDJcSYfu/M+MM6beFODgtTj6jJIRI82iPRzvnYrZYkNnqFgNfHJvFCYqHe2EzyNsAn5B3X7kCCl/pBh8RJYHIXTssdse3UeGDIQaFrMik+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVhF/3I1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVhF/3I1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95901C2BCB5;
	Tue, 21 Apr 2026 08:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776759581;
	bh=x3FLqMOzm01h7XoAdDrip3GVnx8vRPi8aOzgEXce4/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HVhF/3I1ZKV96c+aN+pQ11vEgBoBgYFwGpWPfKPHJbf7DMpQIW2RTObkZCKWp49DR
	 1E+Cy3oIuoV9zPlPXTeB1Ey5DUUzrSS9j+2UebRT9+PI/gvlmWUVEGFkOiIdxgocr8
	 pPmJGgR46vwd4DPxeSYx2iPwkICExC8bZB1DphOGC3Ctv/umWc553s4nyFSDBR2y+h
	 SRvk63Migz8cbK2wSkNWcnm1D7WJdVWEhpOJeG8SmcYx1cqQhMmJhWT+dpgUEKvo4V
	 wxW2lC//mYB7LYSa9Wt+640ovJEvvsq7+wSa5XiO9p8mxsSvpeFfRs1HQiv2jv1QDB
	 YvniKCc8M9zQw==
Date: Tue, 21 Apr 2026 10:19:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: cdns: Convert xtfpga I2S to
 dt-schema
Message-ID: <20260421-mellow-boa-of-control-859a60@quoll>
References: <20260417110410.4482-1-chaitanya.msabnis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260417110410.4482-1-chaitanya.msabnis@gmail.com>

On Fri, Apr 17, 2026 at 04:34:10PM +0530, Chaitanya Sabnis wrote:
> Convert the xtfpga I2S controller plain-text binding
> documentation to standard dt-schema (YAML).

Drop YAML references.

> 
> The hardware requires exactly one memory region, one interrupt line,
> and one phandle to the master clock. Verified these constraints against
> the driver source in sound/soc/xtensa/xtfpga-i2s.c.

You changed the binding - added sound-dai-cells. This needs short
explanation in the commit msg.

> 
> Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
> 

There is no blank line between tags. Please use b4 to collect tags.

> Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>

Subject - s/cdns/cdns,xtfpga-i2s/. And then drop redundant parts. You
are not changing here the cdns (cdns is a company), but a specific ONE
file.

Best regards,
Krzysztof

