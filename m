Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4EB3B0AEA;
	Fri, 21 Aug 2026 07:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787298257; cv=none; b=plueJ+wYgBPFOM3F6Esh6Kos1z+lsrOT2xvL791+MX0gaBSGnA4l4iH7oE0kwVd3w2loNSYDnb19u5/OIJFSaaQDn819NC/lXJqM2wJQQN1jQ9hDB/I6T+DSLlV2kZOpxF2bdF1oi9j8MAUV9bekoNTDa0zcpbVhfKV5ocDsRc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787298257; c=relaxed/simple;
	bh=MqfV0nNeifyM88acdUHn5aO2f8L17ibUdT/rK43pAuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dk8fBmMIUREYarFaTvaNlOSCrPsnIiTOSQ2wPKdE9a3jW2e3IyuBiiY3uvyatGV6NPiYlyyFx+yu6xNq0nWyZ89xC+JMVHrC/NY0EtJDzrlxzFBzIKLYkLQNha7h4O59rHOPIlLf1VzjI6VruFNKjBpgQWt3JAoPyUcTHAhmwpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iz0WIGc9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iz0WIGc9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71821F00A3A;
	Fri, 21 Aug 2026 07:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787298252;
	bh=VjXQZ4YqL5x4QZ1X8CSM8ipD+GmxEbhHc6vBGHqaXgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Iz0WIGc9UvmVtV9tm4OIJc09o6oNQoI++86LWj21c3UwjflKdCgPGuJest5Se2sCS
	 +h+WDtRXOenePwRu/ZWIfBR/YvjpXQ62FDhG1oODctCXtwCa1eJwWLXyZxyRRXY0JM
	 RLEWXhVVInBZ1L4S8jrTSnTQvbIqIt/QZKchYQjqbADVoLjkm5arUpebAXWlQyDiVs
	 XauV7apWUcGBPufhMwl4GWuotdkxdA2q7I0y6Nblmdu/areezr40z0qPRwLhGNfZKl
	 vogpO9JcVUEnxvsk7MSg/EOM5KpphOIgrk65eIUoVr587LD9zb1QZTYFODYy49vLnN
	 43jCQxUtXyWaw==
Date: Fri, 21 Aug 2026 09:44:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: sound: qcom,q6dsp-lpass-ports:
 Rename QAIF clock IDs
Message-ID: <20260821-omniscient-shrewd-butterfly-d24c1f@quoll>
References: <20260818084655.3240284-1-prasad.kumpatla@oss.qualcomm.com>
 <20260818084655.3240284-2-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818084655.3240284-2-prasad.kumpatla@oss.qualcomm.com>

On Tue, Aug 18, 2026 at 02:16:52PM +0530, Prasad Kumpatla wrote:
> The QAIF clock IDs were introduced with a LAPSS prefix typo. Rename
> them to use the existing LPASS naming convention and update all
> corresponding in-tree users.
> 
> Since these IDs are new, rename them directly instead of keeping
> backward-compatible aliases.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com

You wanted a Closes and Fixes tag.

> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  .../sound/qcom,q6dsp-lpass-ports.h            | 56 +++++++++----------
>  sound/soc/qcom/qdsp6/q6prm-clocks.c           | 56 +++++++++----------
>  sound/soc/qcom/qdsp6/q6prm.h                  | 56 +++++++++----------
>  3 files changed, 84 insertions(+), 84 deletions(-)

Best regards,
Krzysztof

