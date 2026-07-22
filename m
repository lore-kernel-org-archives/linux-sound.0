Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D28443A8E
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 17:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828106; cv=none; b=Byh9/MFKZ7yW6V+9SkIZzoodPCmDJuyeFrosluCCwIbffWxLK1W88Jqv2WyIaUGLVzaog3RRhFAucp3UCZnenKR1pIBiUjoPu2U6tk46NzAS2V5M8YXBYrJMBErZqPBO5ja2h6vnaADTp9S8dxTbmUgDB05o5/D40nSfEOk4U7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828106; c=relaxed/simple;
	bh=1nO30bSSpWzYJOQDVnxZ+Col7gVxHp/vGNGO1xDS9Rs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DVRNWozLz9BQ2O+6bRuK4dOtyYpy6T5kt9G4kso5527y7MFvV1xRMMQ76OtnEkIrj4jdbGM0keAjGS6mjnzqayJwYnUiUy8JAQNibcSId1hLnM95MWmhkV9sPeNx84JXhm/WZ3lOvkFL5wt1RWcJS3571HHLjv/7t5f04kGWoDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FtiBt4q2; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FtiBt4q2"
Message-ID: <857b28b7-1ddd-41ad-b7fe-dbdcea3fbfc4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784828100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J7AvBJHIwMTgHq2EpqdRVW6NaWzmp2W+mb52CHk2kSQ=;
	b=FtiBt4q2xZPpCbZAx+15Pxt8K20JTr+W35zM1sjfnCK67O19oOVqwduf/JAwKHMPP9N/5I
	IwYbzaBgodUrmIA7eFSPULI40LBzO4fYcIyEXnjrFcxTCBCqYoXcpVsnb0hXSrFGJzfuar
	PHjSK559DjrdRA92sELFFkWrKXyY9RA=
Date: Wed, 22 Jul 2026 20:15:28 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] Series of SDCA bug fixes
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260722103500.872714-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260722103500.872714-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/22/26 12:34, Charles Keepax wrote:
> Fix up some error path and size checking issues in the SDCA code.
> 
> Thanks,
> Charles
> 
> Charles Keepax (4):
>   ASoC: SDCA: Correct pointer passed to devm_acpi_table_put
>   ASoC: SDCA: Always free firmware in FDL path
>   ASoC: SDCA: Make UMP message size check more robust
>   ASoC: SDCA: Ensure that Control Range is large enough for header

LGTM

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

> 
>  sound/soc/sdca/sdca_device.c    | 2 +-
>  sound/soc/sdca/sdca_fdl.c       | 5 ++++-
>  sound/soc/sdca/sdca_functions.c | 2 ++
>  sound/soc/sdca/sdca_ump.c       | 4 ++--
>  4 files changed, 9 insertions(+), 4 deletions(-)
> 

