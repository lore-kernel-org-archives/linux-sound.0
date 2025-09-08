Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C0C2F7AA1
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757333682; cv=none; b=ch6+F3pdpKxC0+0JL9ImiY67BFRGmwgZe9TugzySPBXvyoDY1a7nQP8wOkfEZN1+MVfM68IywoTlaKwKWuyIRFhy85lXSC42apgHrsqjz1lhpNJX6uYulRWnqAWyIgQkC17BburDSSClLusBZl6MeaHVYUgF1ZpPDzlSWemYc8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757333682; c=relaxed/simple;
	bh=44vtGYJ6cuOcHOWwZ36BhBqjVjD5Yy4vYMj0yeXlMGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/99jYeo3MXImfHDRAxrleF0XnX0Y5Y9u3FA2+UlBAz9XnP6Oq0rPjxXMxQwzYgNgJCJ3rI9bk7fMVDgHj4YC2yoYX+Ke5E0axBiaWkMvaDRATl96Du5lx3hzQHlFtWvbrWlwawl9i7/hruyO0Xi/tLGYAM0Ungb0GT/jctfuXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YmqlAYMU; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YmqlAYMU"
Message-ID: <1026f2d4-cc5d-4824-8828-1e129e44e6d0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757333679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=44vtGYJ6cuOcHOWwZ36BhBqjVjD5Yy4vYMj0yeXlMGI=;
	b=YmqlAYMUODnWrRV0Yfel/yvXJ7ggcfmAPCQijrbrGSQEqkZewDXaZUIDtbplMFZnZKWtDN
	iyemO0eDEh8av+Kdun5Pn9uu1MDmI+lRsS7X6/zQj6nUfMWYTyouoiSGd5wGveTXOdLRob
	WGejtTlLMEafN8MjtqrNT+iJd5mBuTY=
Date: Mon, 8 Sep 2025 13:55:21 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 07/15] ASoC: SDCA: Rely less on the ASoC component in IRQ
 handling
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20250905143123.3038716-1-ckeepax@opensource.cirrus.com>
 <20250905143123.3038716-8-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20250905143123.3038716-8-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 9/5/25 16:31, Charles Keepax wrote:
> In the future some IRQs (mostly File DownLoad) will need to run before

nitpick: I think you meant UMP interrupts used e.g. for file download. I am not aware of any interrupts for file download proper.

> the soundcard is constructed, as such refactor more of the IRQ handling
> to use raw device and regmap pointers rather than accessing things
> through the component.

Maybe elaborate that these interrupts would be used as soon as the actual SoundWire device attaches on the link.


