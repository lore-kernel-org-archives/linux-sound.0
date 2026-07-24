Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD998634C;
	Fri, 24 Jul 2026 09:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784886524; cv=none; b=ug9fnCqyQhua85u28v41lzeGUzB+ne4iqmgXNks1bEsNNUl2BqqtmhRSZxrqSEqySjY7uyPJCntPu1WXmRKAwlOs+njDIX0ci5Zq8fId04Str2J3jRRtnpnLjFY+Gu8q3gTKKy7SGun0ONUZEszHcz9vyYuujY59wlzV/XiCurw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784886524; c=relaxed/simple;
	bh=gLvi1JinIMV+ch6tb6azP9UGrik/EtvgKfJ1V4l3MIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jR/0FSp6xohgT3uYXaNnSE6daXifOJ4Gj2h/DYdUUkDDnGffM8uxKNDiyxC4QKGjRzpBzQOJyDDaA8usUsVYe1vCbaB8OSIMLoifhNe7Vsgu1OEWQq0iC5aJ1ivvn0eOZNNlMFqR60MVGhKXuODtBuNDQSAAVZhuUzYBlrNwQvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZaHapuEi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZaHapuEi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D861F00A3A;
	Fri, 24 Jul 2026 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784886518;
	bh=auOmFhz4bJXnzsXU47Kvq7eP5lxUSMHYoQM/WI9J8Fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZaHapuEiLWhGoFu+ZREemYrqhqNbBsV94/CWFyLQOna6r9uNLER7211oyb8LVX6q1
	 m/hV+0DPvVnPJrNemuD2q1GI7li2WA5Z6ATyxeh0whEJFJeLfzvZki07w2eqGp0Yyp
	 kDVh3rkc8zS/GRuPiqzx2Y1pWLWa3HqicNV+FP3iCcOMGta2/9RqgrYUKYZZToTq3E
	 LWBM0sI4VH8nQxNT15y/J6R0vtWG1HTl8gQbFUSbbST0WrnWaZQszbUpo4VpB5lhwJ
	 LRddOnb+0K3ZruqHRg47PW1qu/8qRGcB5b45h/U9VXEdva6BWTABrjWZABgxKF7Jvk
	 PMFvoG0V1R/7w==
Date: Fri, 24 Jul 2026 11:48:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: sound: remove google,storm-audio binding
Message-ID: <20260724-pink-pig-of-philosophy-6644ea@quoll>
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-2-23ae4a689ffe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-drop-sound-storm-v1-2-23ae4a689ffe@oss.qualcomm.com>

On Tue, Jul 21, 2026 at 09:12:42PM +0300, Dmitry Baryshkov wrote:
> With the ipq806x Storm machine driver gone, the accompanying device tree
> binding describing the "google,storm-audio" sound complex is no longer
> used by any driver or device tree. Remove it.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sound/storm.txt | 23 -----------------------
>  1 file changed, 23 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/storm.txt b/Documentation/devicetree/bindings/sound/storm.txt


 subject: ASoC: dt-bindings:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

