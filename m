Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A148719E968;
	Fri, 31 Jul 2026 08:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485327; cv=none; b=SjQKfHXWBO+hcgemyaCuslWo8nfb0bkB9JzAQ4AZC2T47WM9F8hTUp6gm0kt2EtlTcM2sIBkl/iMyW8PpXUbziZYIKdZc881x2qaUSslp6XNg/7iUyYv7pqgZJrs8RYAuFQnrtVMvbTwUqbDKma35DintoJRYwdrzbaxwYO9HPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485327; c=relaxed/simple;
	bh=OzlLuvgMnvAEO8S3ejkPUQIv7y1SMjTPg0Lg4dQUeQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSf7PfLvpxB+0rB/X3f53M0brWqGwkHhO7i2R9YeAb4N1n3CAw8Fe/7g4HMkAdA8ShPRTYeBmhah/cjFkLi3jN6zy+vKPm59FHlkGx7wWmC8jtrYEVhbbTk7PoV9L3Ctm1va/Vqhyeke7L77v98QPOXFWMiuNd08YAt9ModlcQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKbj7YyP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKbj7YyP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C311F000E9;
	Fri, 31 Jul 2026 08:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785485326;
	bh=R5XZTHUIk/S1MJaXljJB9frdsnITpwjYzXpkuZvcnqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jKbj7YyPXG3/LVbEYICHCRaSXAig2k7OJCofRPFf4tquRkEEbw5VEfMXMBDpiFI0D
	 e8k5GvyOhXaTs62YVWMESz6XCDWe8g/sqMsTwpbiZ7UHXbxknQ5hZnPIEXOs35481a
	 4thJRYGVLKwT0PKdwt45DDs8+T2pdnBKGyTf6i7USbB8+e+xvEm1ucW2bw7RSN+11E
	 BjvAGUhS1fTSA7A3uPxbLf0pN75wnzNR6H8RgMxzVzE/8OIy66JFteIFgHbIBKvqxG
	 muPTds+7p9zpIkZHKVleZCYfZc3e+eLbtnVpNeTsLcvnDRT9vKhr2LoRMn1qHEWZwm
	 e5Gldo0huGWYw==
Date: Fri, 31 Jul 2026 13:38:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, broonie@kernel.org, tiwai@suse.de,
	linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com, bard.liao@intel.com
Subject: Re: [PATCH] ASoC/soundwire: Intel: reset the PCMSyCM registers in
 hda_sdw_bpt_close
Message-ID: <amxYCrVut69Kb58g@vaman>
References: <20260730012518.2180906-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260730012518.2180906-1-yung-chuan.liao@linux.intel.com>

On 30-07-26, 09:25, Bard Liao wrote:
> Resetting the PCMSyCM registers is required for Intel SoundWire stream. The
> same procedure is done in sdw_hda_dai_hw_params() for the normal
> SoundWire stream, too.
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
