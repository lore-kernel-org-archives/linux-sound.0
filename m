Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A6A3B6BE3
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 13:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243810; cv=none; b=Krzun2nCe9gybQ2VDyzXUaGGtLN0O1k19riHSFSNXGp5Bq3qfSK3Bsn5neduZyfMHkDZS7NCReSjnWw5LI/yZdXlgpEScv5F8lEO41kZszaNeXKhJXVedprHJia1/0WtIUm+IwFEW9G6dtDAAr5bl31JqRCoi7r7xagLzhJiqqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243810; c=relaxed/simple;
	bh=nqZCcrRdn9mHhVrKz+Hih2rfMV3Om1H2kjVL7UAAv1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NfreIl2aeZI3ExEztOMpQalruBQsz7L8vwQtKXXTmZzhWNU8Vpa/FRmc6A6wOwWTBU49xvImnAJ6JS9kEYW5KI3CDFCmw0TYWP1LOIIIOhn8GRruDIsi+Wnz864lUsA7KvfyKM4M89rmdEhtiRDhWZ3KEr/GVsxUJkMQ+SIW2J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ie3xqjUK; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ie3xqjUK"
Message-ID: <e0858bf7-e147-47b4-87db-bc09548a4d9a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785243796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kE+EC4C02vunk0b1q7i78+w/4Hr/vFJK6sChEV+2IVM=;
	b=ie3xqjUKmeJNkWk2mUa1py6vbsg3VUAv8Kty9HBvcHCGpUZzD/GvxeGwo7ORre6aiuwC/Y
	z21OyGgjhj+GCLvGioYhel+vVgnbqBRMyU2oohOsVBUQgvArBRty0Y1nQMijbxIy3ovgA5
	hgJboTVrjWvtzoqouT5SetK3MuSfBCU=
Date: Tue, 28 Jul 2026 15:02:17 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RESEND 0/5] soundwire: add BRA properties
To: Bard Liao <yung-chuan.liao@linux.intel.com>, linux-sound@vger.kernel.org,
 vkoul@kernel.org
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
References: <20260728124639.1484973-1-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260728124639.1484973-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/28/26 14:46, Bard Liao wrote:
> This series adds mipi-sdw-bra-mode-max-data-per-frame and
> mipi-sdw-bra-mode-block-alignment properties support and fixes the
> BRA_NumBytes[8] support in cadence_master driver.
> 
> Bard Liao (4):
>   soundwire: cadence_master: add BRA_NumBytes[8] support
>   soundwire: intel: handle Peripheral bra_block_alignment
>   soundwire: get mipi-sdw-bra-mode-max-data-per-frame property
>   soundwire: intel_ace2x: handle the max_data_per_frame property
> 
> Richard Fitzgerald (1):
>   soundwire: Add bra_block_alignment property support

For the series:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

>  drivers/soundwire/cadence_master.c | 35 +++++++++++++++++++++++++-----
>  drivers/soundwire/cadence_master.h |  1 +
>  drivers/soundwire/intel_ace2x.c    | 20 +++++++++++++++--
>  drivers/soundwire/mipi_disco.c     |  6 +++++
>  include/linux/soundwire/sdw.h      | 14 ++++++++++++
>  5 files changed, 68 insertions(+), 8 deletions(-)
> 

