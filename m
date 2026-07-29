Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3884611C2
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 11:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785324882; cv=none; b=pARaibTC7s2H/AimCh5WHboFQzZYoCFMf/tYGTClQZEp3IHkuTVXFIBJW1h6v0zxhNq7Z8i3/0nKiEC/vMe7cOEKhC1+DLy5Zd18N1Y0XWuXHSUG87VOjywURG9wOoQ4pQowx9dDOc+tv98Uifhj0xcIcW9rU+K8ODeCYpfsrxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785324882; c=relaxed/simple;
	bh=6n00yLZITeA7l2mEU0m7pooG3likiG5g9DePIvmzikU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mea4r1bKeRiLW9DLYs+wJjb4PV27OgMO29UN2muwgq1ZcqgXWLx7r1CeaziuJvVRpDCiayxtuE+lSg9ET01fc1aiw1RlUcUQXU6EhN2x1SxS1BqvLr07Ptsal91ZxYpp/4xqV1zVKruCHhdYmH6JuWGaiSkHq59fKMMdSI3bdv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TeVMGFS4; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TeVMGFS4"
Message-ID: <2ba482b7-4edc-4f29-801d-9d08f262f898@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785324878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ql9wArayAg8pwhSAGaoG4NY/zLa7CVEZhB3T5cOoAM=;
	b=TeVMGFS4lKHHDVbmVusP263XhJITw/aRF/dkdk6VKqgpbfG8suCE2WCoZ2tBSPTW13ouAD
	5inOd72n5C/2fRqzgXmFRc4QvNef3HPryp2mq3DpXWVu1VAw2CnirhKQ1ERh4IXI5j2qnP
	AbQAHhvQim50zetkgZoAmnTZ92Lf6Kw=
Date: Wed, 29 Jul 2026 12:00:09 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/3] ASoC: rt766: add RT766/RT767 SDCA driver
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
References: <20260729032246.3750820-1-shumingf@realtek.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Content-Language: en-US
In-Reply-To: <20260729032246.3750820-1-shumingf@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/29/26 05:22, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> This patch adds the initial SDCA multi-function codec driver for the RT766 and RT767.
> 
> Signed-off-by: Shuming Fan <shumingf@realtek.com>
> ---
>  sound/soc/codecs/Kconfig          |    8 +
>  sound/soc/codecs/Makefile         |    2 +
>  sound/soc/codecs/rt766-sdca-sdw.c |  341 ++++++++
>  sound/soc/codecs/rt766-sdca-sdw.h |   61 ++
>  sound/soc/codecs/rt766-sdca.c     | 1339 +++++++++++++++++++++++++++++
>  sound/soc/codecs/rt766-sdca.h     |  138 +++
>  6 files changed, 1889 insertions(+)
>  create mode 100644 sound/soc/codecs/rt766-sdca-sdw.c
>  create mode 100644 sound/soc/codecs/rt766-sdca-sdw.h
>  create mode 100644 sound/soc/codecs/rt766-sdca.c
>  create mode 100644 sound/soc/codecs/rt766-sdca.h


LGTM

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>


