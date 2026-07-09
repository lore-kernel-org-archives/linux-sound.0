Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B70F3FC5CF;
	Thu,  9 Jul 2026 11:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783594805; cv=none; b=F5CknHjpLBVDPaVs2RE8iQCzPNpe1xqI+S0IYusNLuZa5JdvQCqdmWcJRkbSZU4pQtOhq9RaA3lbRHMmRXRuTHMlFZAcWbRGciYr97KzKOzGfLJulPskIOEt1CFiAknQchGq9OCdm2ZykNVzWGbJPqrgHbm3SiJJTGQzxrP8BTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783594805; c=relaxed/simple;
	bh=7LYxiWYst90mqUWYrUD84Wjp2ia4tiTRjBcihDb5XMA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TNgBhDvQDiJWDJ/7nwFRxcQqOC48IA5szva/rTtEN6U2czAj00q7XWQQ73RVXPFApxPV3t/W7BFM1GszI1aickSSoASTx9IMa+8EVydJBP06sBeriUdPpCg3lJDZCq760ZvWj5y7YIykG8AMH/TnPD4mcRztekYcseIrmtl5+84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MU5ohz9b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MU5ohz9b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5971F000E9;
	Thu,  9 Jul 2026 10:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783594803;
	bh=MprQAKh2M/FtwGqOd4VDQqoZaU2yZXCQ18QWe8n/Kng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MU5ohz9bmKHFCulLWiU8ZqPv5hZFxfJzR0OkiWeQ2G8uJYXIXQXInlOo0qCBwHHJP
	 09mOvg9wZj8HP6g3wXbL4tx9uDhqXRCZCPk0xhibWa73B8uTh5B/WlQHss96tEgDj/
	 X2ehGRo5lUQALbIc93vI1o413xDOkiHfnJG8Jm50du3Kk1sF3fnaezkDWZxNKrBYJ9
	 K/4Ai66OKaHVMT+TgysvQj6bfdarHmBiUqgYPkDj8vVuDsGC/5MghGzRyhZxvvh9xg
	 vN20w6xPqIbUSomclxBcPp2GJem99Zr+unNKUmNAw2M5x/WbY2o2K1LS/noslRr2RQ
	 k2hosyPEkt3VQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Colin Foster <colin.foster@in-advantage.com>, 
 linux-kernel@vger.kernel.org, 
 James Ogletree <jogletre@opensource.cirrus.com>, 
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
In-Reply-To: <cover.1783003256.git.u.kleine-koenig@baylibre.com>
References: <cover.1783003256.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1 0/3] mfd: Initialize spi_device_id arrays using
 member names
Message-Id: <178359479977.2113490.16055346814964770733.b4-ty@b4>
Date: Thu, 09 Jul 2026 11:59:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 02 Jul 2026 16:53:38 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> this series targets to use named initializers for spi_device_id arrays.
> In general these are better readable for humans and more robust to
> changes in the respective struct definition.
> 
> This robustness is needed as I want to do
> 
> 	diff --git a/include/linux/device-id/spi.h b/include/linux/device-id/spi.h
> 	index 812e7c3854a7..93d9cd45569a 100644
> 	--- a/include/linux/device-id/spi.h
> 	+++ b/include/linux/device-id/spi.h
> 	@@ -13,7 +13,11 @@ typedef unsigned long kernel_ulong_t;
> 
> [...]

Applied, thanks!

[1/3] mfd: Drop unused assignment of spi_device_id driver data
      commit: 8339fb0eca348d41f04bb9631707192569f753e6
[2/3] mfd: Initialize spi_device_id arrays using member names
      commit: bdaceafafa54b3fd4f9dba9e0044a910f16e4a2c
[3/3] mfd: Unify style of spi_device_id arrays
      commit: 6384e5c5e0bcfbc9a915d70cb3925e0022d7b337

--
Lee Jones [李琼斯]

