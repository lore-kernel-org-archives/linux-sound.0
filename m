Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E889A31
	for <linux-sound@vger.kernel.org>; Sat, 23 Mar 2024 01:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711158168; cv=none; b=ium5qlUld2/9Th6jutRVReJYXgTXUXaaUqwskVkpr6XHq6UoFEIS+7NVzYiiPom28TpTv0ZL59DpqbMz2jWPMuHoHs8q8p/qd22yYmBZBbB1quRS0GxZCQFJq4yEuq/BlFXdObQVx2Ss0XK+Xs9z0VVlOMoyYOM3qqowc7E7D4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711158168; c=relaxed/simple;
	bh=kmA52/Y1gBrszvKZJP1S20hNrjScCZmCd2ui3kkG0x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=elQ0WNApO3kYkHSYtMi798SrfrwS7LnxZrPrM2bhvMCNDOYqiC0pCLJcocL3GK3HghT7bnUD7y1H3WGT6YenAzVklfK6C+d/JwbMaH8KqPwYGUQ6jpDtyI+oqGgmDZ6z92eXV1fMeNLdNTS6Vf7Bvevz2d8QMrsBXdtAzptBIZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGUrIHr9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGUrIHr9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711158167; x=1742694167;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kmA52/Y1gBrszvKZJP1S20hNrjScCZmCd2ui3kkG0x4=;
  b=OGUrIHr9tuipbNJHjDW3skVAORqvQmMAL8XEUIHDO1ubB2CwOyBeNyjh
   ANsuybuY5JjNq+Os9rILwLTyxNimBhQ1SXSNz022AwN1Bq0vT3sGYXLoj
   vBQS1Gt8s3rGh+tMJnYTBvQM45fjc0yQEgABcPdS3aRrV5PrhmYsgcW5z
   YXrlS9hNI2cdPLxECDFkasPz1AljtbsTU7Ke4glkDCMpWCcyKfzzTP/xO
   0H2GL/Km48UDvxaK09ZIaNueN+gF3HYRE0Anusr3b8pth7htwtsqPZBQ9
   CYe2J1vz5oNXY7zKfXL/oknZS7xbLs+XqRdW0vRALFqGuyT9CKhb7ox/q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6434663"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6434663"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 18:42:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="19636662"
Received: from ajbawden-mobl1.amr.corp.intel.com (HELO [10.212.109.118]) ([10.212.109.118])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 18:42:44 -0700
Message-ID: <2089e703-62b9-4aef-9722-488fe14d4546@linux.intel.com>
Date: Fri, 22 Mar 2024 20:42:44 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] ASoC: topology: Do not ignore route checks when
 parsing graphs
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, tiwai@suse.com,
 perex@perex.cz, amadeuszx.slawinski@linux.intel.com, hdegoede@redhat.com
References: <20240308090502.2136760-1-cezary.rojewski@intel.com>
 <20240308090502.2136760-3-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240308090502.2136760-3-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/8/24 03:04, Cezary Rojewski wrote:
> One of the framework responsibilities is to ensure that the enumerated
> DPCMs are valid i.e.: a valid BE is connected to a valid FE DAI. While
> the are checks in soc-core.c and soc-pcm.c that verify this, a component
> driver may attempt to workaround this by loading an invalid graph
> through the topology file.
> 
> Be strict and fail topology loading when invalid graph is encountered.
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
