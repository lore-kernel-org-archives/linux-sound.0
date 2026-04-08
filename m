Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E4736EAA4;
	Wed,  8 Apr 2026 08:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638088; cv=none; b=o1YjAHBEC15k2uDrTMqWbKRjNgc0zydAzQyPRVpfpjAu6+clvDTjAB0UBzcLN341F4Qv00dUgRuOzrI8KC+6Scufu0rz1scGJLzephgB3AaihUpKl08iWd5s+NBh3VZ8EfAYtQuDc+8u4VOafr+AhtTVjqnF10gDJJkFHDSiRYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638088; c=relaxed/simple;
	bh=PsWUcPAlz/cLBzFS7pyLUIUTmXfxaJc8vS38OlFzuFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEgl5XceMLZl4DooJiRXyTCsR4cYgd6cMZ//M4YC0tresNVVwIwGHR0T/Abk2CZtNFe+0Upd4VE9JKeUHyrZ/4l2Px++EP+y71YS4CRdlt4VN2axH9w/eVX1xHgb5umzscjVXUIjy5LpiHMpOfFsBuA6uXA6yHmXWUaMgc8eVo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDBcoYxa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDBcoYxa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089C9C19425;
	Wed,  8 Apr 2026 08:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775638087;
	bh=PsWUcPAlz/cLBzFS7pyLUIUTmXfxaJc8vS38OlFzuFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDBcoYxaUxft0zVMWY64AMjIwhvSy3MZbZvywrb13J0wcKrFOS9DA4VH3UBt2G+cW
	 u+7WAUAynIq8V4aHxIgNyXrepBueKBp1C5DEg8wcLXqZGRmrpL9yvmZJycNZXJnVgL
	 Abu7JdBOpSEhGYcckRIDZ3bJqaG868xrZxBtR7k+2zwlsYITzlgdc9MrICGHikdvLP
	 T2mNHedHxtLeKiubjR0C0MqYhaNL2vZRjSSRmdaCsO97PLFCt+JXUBtl4uFW0qTJjz
	 aFGf8dKZoq6QbgMIpGKRlhzYJXBwl60MHSeR4SX9jJMBPjoB2qBFOPP4qQEswRHx0G
	 jf+MGBd60YP2Q==
Date: Wed, 8 Apr 2026 10:48:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Judy Hsiao <judyhsiao@chromium.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 11/12] ASoC: dt-bindings: google,sc7280-herobrine: Add
 Radxa Dragon Q6A sound card
Message-ID: <20260408-pretty-poodle-from-atlantis-dfd1fb@quoll>
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-11-14aca49dde3d@radxa.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-11-14aca49dde3d@radxa.com>

On Tue, Apr 07, 2026 at 11:20:03PM +0800, Xilin Wu wrote:
> The Radxa Dragon Q6A can boot in EL2, allowing the kernel to access the
> LPASS hardware directly. Add the compatible for it to the bindings.

You are not adding compatible for LPASS, but for the sound card. And
since you mentioned it, what happens when you boot in EL1?

You need to post bindings for both cases.

Best regards,
Krzysztof

