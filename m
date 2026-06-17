Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7783B9DAC;
	Wed, 17 Jun 2026 07:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679616; cv=none; b=FTzCS/W1mvSPjsg+EkNkNFpa7vlqCVenrT3oy4G6DieE3UE51tKm+LvXkz1aORls0L/D8BwlH8QJNBhgGWCJB8TVpk8ZCWbxil81J6IvbqtDT7uKAtwnqldsAo/XLuZgRX/A6wz+lgiCH5gMKNdvUYZCnsBB1YjTLYZWRcMUGQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679616; c=relaxed/simple;
	bh=gEBoH7P4rHLhdGRp31iUM8PUktzjooSJaGoiByHE8jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uakHZSDMoPTsneJSZOH7sRWwFRDQO9wOWo/iSDxZvIHgvErvndNeuAbjqGAZdYVFBggvgCOzy9L4GXhd1LaGw/MaC7HKHjrpQs5JvYmF9HeDfXcRZCQLITyPbCYThpnaZPBf6qv57erqhu4m9vCFCd9ETvpsEDXV0VzqHWu2pWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5421pE+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5421pE+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF8631F00A3A;
	Wed, 17 Jun 2026 07:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781679611;
	bh=XBpoUxlFURwMzl39lkkX4tmx4aM2S2NACZ/n3dp5+so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W5421pE+zesDptUzhst7HpNXtPpcGlPo/CiLMC/qhE8rYuSI/5U5sNi0I5eArizU0
	 QvPq4kaZk0RNSQ1jWAf3DhbbAHcSTsnYhjRXUJxqoqJdcPEekxE9yuL8uqHpfcmxrp
	 ZoVKs/bNRjW2nxQGhG1vy9geof5PQ/m1HL8eAFuuIqSZj9zex6hUnPkC00/uIg3f0Z
	 /VtC3/amaHyT/cu1heN1M44vFzjhgg4B7WXr6YxAQ8sfU+VG6SvhT2su7RF0K1+KP/
	 brpGHo9m+WoaRJKWcIrPW+NY2lIeKmfXhYaNbJdQ4LgT9SmJoe+KEHT5JTco6zyYSm
	 AKtQGmL+zh8uw==
Date: Wed, 17 Jun 2026 09:00:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] ASoC: dt-bindings: mtk-btcvsd-snd: Convert to DT
 Schema
Message-ID: <20260617-fuzzy-lorikeet-of-joy-f6bd1e@quoll>
References: <20260615185810.11804-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260615185810.11804-1-l.scorcia@gmail.com>

On Mon, Jun 15, 2026 at 08:57:50PM +0200, Luca Leonardo Scorcia wrote:
> Convert the mtk-btcvsd-snd.txt DT binding to DT Schema format.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
> Changes in v4:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

