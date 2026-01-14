Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCEA274B40;
	Wed, 14 Jan 2026 05:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768368381; cv=none; b=T3GxjIiCR0W9zvKDA4CCj42XzSGPmBJ4Q4DehQaVBAe1h6FAUTYN/pupp3ngH4Z5acIedtS7GXSg0F1YFf/JlB84kxNeNEErAJMo9ca/BEcGeIzRa8dxe7S5jbzAQ8wZPDYIS8an8uKKvE6jjUptFvNVTpDuDcxjvx884eFeEUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768368381; c=relaxed/simple;
	bh=IFDXDtZyZXEM35Wnc+ZUP0eNJrEagpUvHijKlqP+Li4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sm/84bLsXjV1lAPXUI2wzy3OMIu51k9ZV89hjEJ4QSi49JGF/xUmApMsHls0xrCt65d4gzW4O2B34zqoxFl0rrSo/kCTIxgfcbI0eNacPg/FeAKFZKeq2uPq0UMH3Ylkdv60fe8CMqMoWg7RdEjmeGgv2VQCxkaVH+SKz6VqNqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m/vWbnhN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m/vWbnhN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFFEC4CEF7;
	Wed, 14 Jan 2026 05:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768368381;
	bh=IFDXDtZyZXEM35Wnc+ZUP0eNJrEagpUvHijKlqP+Li4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m/vWbnhNoy0a5AQPNOAgm6d2xOdT7Vo8AZLLEQCL7MfepLoYBlnZrTAoWM2qU4ywP
	 enIygzkTOcTIYgo82VVc49x1wLH+geWgY/WB9wdriTvNrIAn2FKZt7sMVzNFqXRsG6
	 jepFFv3G/M6GUoqQgDqyYKZssBni12qJuGdiZ8Z9JmLiiwvnLbVUxStxt1N2v1zLkq
	 UaHPP7/p+sK/2w7sa0knDLdaX0ruNMQIYwmdzOP0U4zFsB8pe55ppycRoxRUMAtTZv
	 Wt6fgzMwpEn8KWBAd9bSGGUT0i1ltQkIh+EkB2ftn5GkUZ+2TWCwj5R3W8xCloP7XD
	 PbiDirDlzSSvQ==
Date: Wed, 14 Jan 2026 10:56:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 1/2] soundwire: Add missing EXPORT for sdw_slave_type
Message-ID: <aWco-X-omtS7vLF_@vaman>
References: <20260112140758.215799-1-rf@opensource.cirrus.com>
 <20260112140758.215799-2-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112140758.215799-2-rf@opensource.cirrus.com>

On 12-01-26, 14:07, Richard Fitzgerald wrote:
> include/sdw_type.h provides the function is_sdw_slave() which
> requires sdw_slave_type. But sdw_slave_type was not exported.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
