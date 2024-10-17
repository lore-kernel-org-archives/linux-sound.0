Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E491DBB3A;
	Thu, 17 Oct 2024 12:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729167898; cv=none; b=ijW2mb3HC/58FCnb3OIx+pHtci1p7Oc9sDEnx9LsRUbZB2HGtk4ZxHdHqTn5XI9EEmZpx1TeykP5a4QP0QrJulKBHvhNWItuB8OEo6lvcI5MNI3XNLswSiV0tbDLbi03XSUBAEU9eOCmQjCjcj2eNwxtGsU7ubLLu9GaGfF6tck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729167898; c=relaxed/simple;
	bh=CW0hMWyo2CYtUdqfyZ09UX9xcAAU7iDBLUtOAnPTY8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRq5YWPnJi6rGvXzlsECUYrfZ4DE0B2TJw3+iyGBoA+oOcva/iK3TZRH9yJjpdEzERqhfHFEY3eWI875HESCtAgLnK4Q1wzYBiYI6ipqQuDBzLV/YtmIzsaub0kav4HkccLZl5z6wzjxqQKqj/JG2BzFnZIqdHewkPAm9ZWhFLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVzYAOwq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVzYAOwq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DEFFC4CEC3;
	Thu, 17 Oct 2024 12:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729167897;
	bh=CW0hMWyo2CYtUdqfyZ09UX9xcAAU7iDBLUtOAnPTY8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gVzYAOwqsKNX5nYMMSdBZDwo5DMglsoVuAQ8qTTJK1fxjfI/FdhK1eCGa+TeeJxRZ
	 jijDqAWgGCNJNoyeKvIuR1o/nqQGgoIDop/EAdl71l+iEJyp8Oc5fBJQGC2EBO7fXD
	 ofAoKfbXnBavtxgtTgAb3jwGV8DY54EtK04ncBTT/cZYM3NymyN7jmkqDCUnZ0UuM9
	 i4S+chkk14qLxmh1cWKFRPdBUB64hqlY68c1pUc4iHjPJW5Uk9JToyR0s1hvCSElq4
	 7IjIqwzVTRem0BWza2Bhu2y1IRmMey30vFeROOrxCJwd9j3ADHXWBM5oZmb1rkh7YX
	 rM4AqWo5G1TyQ==
Date: Thu, 17 Oct 2024 17:54:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: broonie@kernel.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: Re: [PATCH 04/11] soundwire: slave: lookup SDCA version and functions
Message-ID: <ZxECFhGHkl+wqBEa@vaman>
References: <20241016102333.294448-1-yung-chuan.liao@linux.intel.com>
 <20241016102333.294448-5-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016102333.294448-5-yung-chuan.liao@linux.intel.com>

On 16-10-24, 18:23, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Use SDCA helpers to get the basic information and store it in the
> slave context. The information will be optionally be used in codec
> drivers to register sub-devices for each Function.
> 
> When platforms are not based on ACPI the helpers do absolutely
> nothing.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod
