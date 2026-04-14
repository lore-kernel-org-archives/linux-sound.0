Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2317F1A38F9;
	Tue, 14 Apr 2026 06:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776149811; cv=none; b=tDb3QbDDfgVd/2TOuY4hf5vvNBm+GPzOhqh7uRhUGh3VpvSZck5nwnGUxq/pB5QcX9Jokk9HLahks5x9gNpcFtP1Xq8Jh7XKzphPUeiwZyoNhX7jAPhbiX0tHJSJ4Pu4GONkT2URbO4unQ6Qb1vRljUEYp6WQd8Fi9xhs21Nyu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776149811; c=relaxed/simple;
	bh=Fp+Cm/3fydupQ9awNaggvZ3weKTKFyLGqmjm3YGZkg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwBbIO+4i0UDSftO1nSVyxDZKfDGARf/y6h5FczYzWaoDqBg7bSZ5zExpVZbM7m+6yPa/pw5tZQVJiygMyGYoJEK3lJkCMZh5vXxJ+I7fMT5kGq7tWs5OcZs2qoY4DoPiTvrb4jfjjs/18zUgj5toXTQgxLcvl0v15SKikcNWng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FqYHrjIH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FqYHrjIH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19CEC19425;
	Tue, 14 Apr 2026 06:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776149811;
	bh=Fp+Cm/3fydupQ9awNaggvZ3weKTKFyLGqmjm3YGZkg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FqYHrjIH5KqDDH/nydVFikS9OWWKxVynf3I9bbfQISCtk4JS28iE8EW60X/NA1tVI
	 KvKb/YeuRBQJNeLjON1ZurU2HZH75QSlMkg8cqym+vxtfzfba0wWVOVpITS6DJ5SnJ
	 TfQEqP2fClIvceWJ0sSspDk57B4zsNeo4eAZQaEmI9S0G++hBfokwaOcUjvy/Y/qIn
	 WETwiHx/cs68Epe5DY5FsaLriKnI2yevXlTt8a+OFpSnUHl0lWpN7EdDZsDBEfEDWq
	 ErdClU/PQlswgrm0J7T/4SSptNtkZiPTuAq+xSnpYdWXlFfQ/zr/S1lZ+BFQdO6yOL
	 sZ0Zom9d1nbhQ==
Date: Tue, 14 Apr 2026 08:56:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, andriy.shevchenko@linux.intel.com, 
	13916275206@139.com, shenghao-ding@ti.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, k-yi@ti.com, henry.lo@ti.com, 
	robinchen@ti.com, will-wang@ti.com, jim.shil@goertek.com, toastcheng@google.com, 
	chinkaiting@google.com
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: ti,tas2781: Add TAS5832 support
Message-ID: <20260414-zippy-caterpillar-from-lemuria-7d70ac@quoll>
References: <20260414015441.2439-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414015441.2439-1-baojun.xu@ti.com>

On Tue, Apr 14, 2026 at 09:54:40AM +0800, Baojun Xu wrote:
> TAS5832 is in same family with TAS5827/28/30.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---
> v2:
>  - No update.
> ---

So you are going to just ignore review?

Best regards,
Krzysztof

