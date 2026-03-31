Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8313E559E
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774968623; cv=none; b=N+qMpjnROxK8v5dmiKhpjvU2zINM2kRmvCt0r1a5GuWL3NxhR5Pxk+IzZI3VwqhvHHE8USSFQQz+gNfGX0VlPxx72C3REo8CDECWCVVsK/tijvGdWFK09C42GrLN3+J8ZHDz1C90da0v8o2yWQ248PGruiCxTXEhUp8XuF1VCs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774968623; c=relaxed/simple;
	bh=vYxHevc5G6EUMLw0+NYm46drfWofBhwLK2aaMJTYsUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YavkNiWEmO5ImKEwvlD76bplZ+adOKgcA2qXjrr5tpT4y109Jvyzjjmfey6w+j2vurbamTF4Hx+PNfLFHp+g+3tWGfcXjQnTQmLBkHCnSAogsU/dRMs+HbCfHF6K/EoNl5/5vkqgkJ+MXEmvT/Jhnmu5SUSvxf1L7jvbMqdaVHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nOU9hshj; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nOU9hshj"
Message-ID: <397b4cd2-adc0-48db-a924-e362e1f512c2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774968619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dWoZCdJZQNOC4kbfmNDySbOlBq7TANYTuODSDYc6MMg=;
	b=nOU9hshjsNn8uRAVXWuUjNbJal2vKCT7mS3pyQ4w1fGp6WTNxBEZ0Mc8d+KK0ln1b8/wAg
	CNXmp/7NYWGQNLJt8bJwzemsZaTW9l/3Pb48T6qcrCW0bG5eNjprRLcJ0mMT7h9G/sBsJO
	WmASu4+gViWnJCOWgbgTFoAdLeS1hPU=
Date: Tue, 31 Mar 2026 16:42:57 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/6] ASoC: sdw_utils: add soc_sdw_es9356
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
References: <20260327095954.3465-1-zhangyi@everest-semi.com>
 <20260327095954.3465-4-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260327095954.3465-4-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 3/27/26 10:59, Zhang Yi wrote:
> Add a utility program for handling ES9356 in the universal machine driver
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>

This patch looks ok, maybe patch1 should be squashed here

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>


