Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2A03EDAC6;
	Thu,  6 Aug 2026 08:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005091; cv=none; b=U6BZSl61/QhKnpGBnDMlBrwU7sSroGahlQgeE0RcM9zmBTBLOTvant5hTSGpQbD6epo6GGTjq/jXluJQX7ceegR7Pf0cxzI+66ZVV57pCtai5d8ri2juohOUXVPneLgE3vGGg54lysGLvw8ohs71eWwthuLNDRqZIp0tGe8gJ40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005091; c=relaxed/simple;
	bh=hR9y3kjnJSY/EQF/jWBk4nSlh9tnQUzwFda4TlNeXa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hHGNh+2yUuJpE+XvyPAM1jc0bYXiQS+N/0eFlfrAzdWH5fiw+iAmgLQerPIWGVLUU/uH/XpHiITNb4Vz/FJZG4nizkI9c0XOQxbZt7ducZicuIXhn5oded/eQlJcPc4ORiNoOuXB0hV+QRw2QDcfL0sLuFzY1AIEdth60tZJlzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbrQc/NV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbrQc/NV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822CF1F000E9;
	Thu,  6 Aug 2026 08:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786005090;
	bh=K4meOA1xj+0MK9N9zhI8DtOKiXZIYu6sg3zPCX32dEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FbrQc/NV52knX825yhChINJxVmkCf91HKSzQ2T8h2/sEjytWa4vtYVyf6L9ezECGR
	 Si1CHlt7B3fI2vp6+HFl+mSxiVJdkX2aGmnzMNdyLs4hLk9j6zfnUgiQIE0XsAnrrz
	 KtesarGgHL4YLUq3YG7k9pxhTHxIEQ9l7dCKZkYNnT7MwhnGJ5Pc/515SgbZ4Fb6Ys
	 5wvkbGu6p6VL7GulozC1Vs+HyYFlZRv+pL3b8Yw/enuhfFZeUqCrpFqQ5iTtcWPfJL
	 tGbxCYbVxVq1pOOiDRWayJXR6WUj/mHGZpVjpLXRjQi32c9O6op2j4Sh8z44NSfgsV
	 UMxu5Cf8KDeEg==
Date: Thu, 6 Aug 2026 14:01:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, broonie@kernel.org, tiwai@suse.de,
	linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com, bard.liao@intel.com
Subject: Re: [PATCH] ASoC/soundwire: Intel: reset the PCMSyCM registers in
 hda_sdw_bpt_close
Message-ID: <anRGXtlGxd5GXQjy@vaman>
References: <20260730012518.2180906-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730012518.2180906-1-yung-chuan.liao@linux.intel.com>

On 30-07-26, 09:25, Bard Liao wrote:
> Resetting the PCMSyCM registers is required for Intel SoundWire stream. The
> same procedure is done in sdw_hda_dai_hw_params() for the normal
> SoundWire stream, too.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
