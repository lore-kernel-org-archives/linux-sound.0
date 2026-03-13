Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D2E2D94BA;
	Fri, 13 Mar 2026 07:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388269; cv=none; b=BeZ9q1s3FgpHmAqArVbo3N8wl1DAl50CcE1D0SVzN430vcLN3s3rNOsTzmR/40buD2egCX+4SQtZ3/WurgkJkOEhjoZjVHUN0BgRKjN1GewoiO0NHYaAQwkJIXIZCsthOAQLmGt3EA5F+hAGEII6P3xD1mhVUrAjTPpRxfo2Z0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388269; c=relaxed/simple;
	bh=SONSZURy4ixAlSJmCYoNm7BkiXQjU3CbuqEfXINxGQY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TAIObnXpKbNnTUmOEgHhcnokh3vMRR1No9RpoFOCUyGDcvrsURexxgYmktLd45G6QOg/TY/D6vgD3EcRlaqdF3CUEQ3W/JwKSvS5DQE/jVPbjfKrYrY3g9vG5JW/yy0h4aNy0+i7kUWk7XuRY8iuEZG+RXNXik+aquXa45ebQg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLtHgs80; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLtHgs80"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77329C19421;
	Fri, 13 Mar 2026 07:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773388269;
	bh=SONSZURy4ixAlSJmCYoNm7BkiXQjU3CbuqEfXINxGQY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TLtHgs80Q/LB37smtY4n60AG7pVgD8PfOMy5IUJIII8Xry5dG8//3ldFqhYpME8rs
	 7VzlQkRBQzE8RscElWBtbxMn2C59lO0MiKkLTSg7sHJUEOULXEgp70qRHnScjBIHix
	 /gez6UOxZEXF+KZ6hs48qCs1Tytc04Npd3RWq5Bm72buooSQEtMLhizPMaeUlknHfb
	 qr7PaYZjP68O8l7oaRCX/tjml0tvv4NxaoyryUDrg+ORBlJsqcveDZnaYXui4p8s/4
	 vc82F8U2OvoSlU1yG5Pkg7mn3yzJdO24UWhVID49bFEZWl/Ab1SsF+n0ijNmHj/Db9
	 FAbgObn9UTZvw==
From: Vinod Koul <vkoul@kernel.org>
To: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260310113133.1707288-1-rf@opensource.cirrus.com>
References: <20260310113133.1707288-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: cadence: Clear message complete before
 signaling waiting thread
Message-Id: <177338826715.194678.13111856655159238622.b4-ty@kernel.org>
Date: Fri, 13 Mar 2026 08:51:07 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 10 Mar 2026 11:31:33 +0000, Richard Fitzgerald wrote:
> Clear the CDNS_MCP_INT_RX_WL interrupt before signaling completion.
> 
> This is to prevent the potential race where:
> - The main thread is scheduled immediately the completion is signaled,
>    and starts a new message
> - The RX_WL IRQ for this new message happens before sdw_cdns_irq() has
>   been re-scheduled.
> - When sdw_cdns_irq() is re-scheduled it clears the new RX_WL interrupt.
> 
> [...]

Applied, thanks!

[1/1] soundwire: cadence: Clear message complete before signaling waiting thread
      commit: cbfea84f820962c3c5394ff06e7e9344c96bf761

Best regards,
-- 
~Vinod


