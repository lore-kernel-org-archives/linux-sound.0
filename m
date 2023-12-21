Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACCB55E77
	for <linux-sound@vger.kernel.org>; Thu, 21 Dec 2023 17:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AeadX2GL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB05C433C9;
	Thu, 21 Dec 2023 17:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703179307;
	bh=Oz9rZKv3srFqXd5f/Yxy9FoX3dnWg2VKT+uxt+4RWY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AeadX2GLX7E0vuqISV8pV/z4EkTx6WYN1QNTeAR++yMgBK/GhIJHIL8IWrDYB/kqv
	 3MLdQpWNx9nGUfY85IQtj3MRUp8PW1BD4S74gTcF/VHxJt5nPnmfxLaFGvulMIDdSq
	 vImZzefjmKgB+hrXq+YikvdVAVj9hU7oe3rnpNCvTIcBt4cYDBUeueFPt87FkaCoSH
	 wxVaardrlcb+dL38Vubqw/TyC0PnZXJU8wiYU81DLe3A3wkkl5ERZ3SfD8ncVE/cPD
	 fEVSwlqO+uLuiOyESiuPdFLTRNV4L7j3yGNyuZAtxyxsRC9quU8TlvpY1XhkjeHRU1
	 1I+FtTyNs8zWQ==
Date: Thu, 21 Dec 2023 22:51:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	broonie@kernel.org, vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 09/16] soundwire: crc8: add constant table
Message-ID: <ZYR0Jttc6TUL4HlP@matsya>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-10-pierre-louis.bossart@linux.intel.com>
 <ZYA0gKf3bZgY4X_s@matsya>
 <121b44fb-9d2f-4e1f-beca-a54b16d7e13c@linux.intel.com>
 <ZYROvUA7RrqQknlM@matsya>
 <98600d10-2130-463b-aa61-459bc1293bb8@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98600d10-2130-463b-aa61-459bc1293bb8@linux.intel.com>

On 21-12-23, 18:15, Pierre-Louis Bossart wrote:

> >> I don't mind reverting to a dynamically allocated table populated at
> >> boot if that was the consensus.
> > 
> > Most of the kernel users I looked have dynamically allocated table
> > populated at boot, also out of many users how many would support BTP.?
> > Your older platforms, current qcom dont, so not point is adding for
> > everyone...
> 
> All Intel hardware supports BTP/BRA, we just didn't have a compelling
> reason to enable it so far. I've seen AMD stating that they also have
> BTP/BRA. That's 2/3 of controllers.

Not all qcom platforms support this, so this would be enabled
selectively for them

-- 
~Vinod
