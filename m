Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A96337BBC;
	Wed, 11 Feb 2026 22:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770847932; cv=none; b=LjYCkb/6Os2ft0KR1Z9X6wA+SdWR8RReFXWjxQxU94JEVhYSvquBkGF1dGkiA/PrXd4n+FPVEH54x9EsSf6TxmV0DPCgmH+BIantg6gCRpZdGVHsMkBZhYAGQn2pujKHwOz8D4Ovv/vPwcotxA/i4SjL3hYN1xHKoUuor0J8b9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770847932; c=relaxed/simple;
	bh=2wknGGj/tQtYgMsR5Og293YW4vT4Sazms0ZgfiF2RdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfzwkWJ6MktQxOC/am5xp76gpSqTOgW46j75I6Ta4PwsJ2iTXsviLUQZVE718wNWbk1yI20kr4IE2RWIn9LV+VO95nFATQZBnWtljgbg8PoMCYdHKiWl8wWrECrpvML/gYND57han6LmASXvyNwnt0iNxl3mijQwRbt0YXY42lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALTQLPMH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALTQLPMH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BFB8C4CEF7;
	Wed, 11 Feb 2026 22:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770847931;
	bh=2wknGGj/tQtYgMsR5Og293YW4vT4Sazms0ZgfiF2RdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALTQLPMHCF6KkggM5f0s9W0ACwPE0sE0nAiNXkLieyzCm3x3oKGbesa5GuzsQ01wu
	 8ZI3updV9WPhzyyBg1DjOiL7aEGX9tN2wT+/K5NS2Go6ZOZiZGo2sAbceQTIaRivaM
	 5Cnxseb/JpVADKV3w6nxNZ/xtWL+OfbXtmwpWajMQouWzcPHMDzAThBHscGelytrDc
	 eagfabA2Ys1k0UvxFwisOEJqsrsgw2ygErBQuHMam5Oss25TgSiCuo3OoNPj2vm0x8
	 rPOCGHIkjcBBADu7/hKdGmq9K5Dv/TxfW8cnVcWTA0kJwNkmcvNWhDzOjgNRE+luLu
	 V1cGHft2u2NTg==
Date: Wed, 11 Feb 2026 16:12:10 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: asahi-kasei,ak5558: Reference common
 DAI properties
Message-ID: <177084792956.4004630.3110943987155530878.robh@kernel.org>
References: <20260211101009.2895296-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211101009.2895296-1-shengjiu.wang@nxp.com>


On Wed, 11 Feb 2026 18:10:09 +0800, Shengjiu Wang wrote:
> Reference the dai-common.yaml schema to allow '#sound-dai-cells' and
> "sound-name-prefix' to be used because asahi-kasei,ak5558 is codec DAI.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/asahi-kasei,ak5558.yaml        | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

