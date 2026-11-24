Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513383;
	b=m/wPJNdWARu13y0yJx43wqau9NalnoaruWcFT7owruFW7RVO/kwypDn4lujC8PXnTH+W
	 trX1/ri8j+cGCIR5dQzrQqZujwwGvEJTJpRnjH5czXXfDxawGeoMJj6ZzJ2+e91WtLa7k
	 rulm8wteq+wILaJodZ0kI7ChWXTGs/ifhE4/zeaYR6ooO7rP4TQcp152FiAT1x2e6JBXE
	 eBZOIhAh/h4pwak64iGF80ApfvfieG1KKaOtBIvzbj4yXsX84x6KEh5LGgGNJjBeWOcc/
	 w8cGiYxtWuSLfz/FRpuJYtjzWyhOtkwbYgBjqExnNHKzKGCOnZYW1KfdOtWw1BlLy2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513383;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=92i7YAwd0gYdMa4hndWWw/yPBSwh8cVacW1/EyPcRI0=;
	b=TW7L4605bO+X6jRqYIeZB/oWWTIIKoqm0A0y6/3pbZb+GCGO8xMf0QAXgUCZHoIKRfkm
	 WpkeBbx1unD/a7DjasGgXQ34mxa3LgHnUvXVFwS/lpTXz0yeQcmueuGu6we9hanjpRDDD
	 o81naX2X7RfODq4TjGUTG3TCibabz0n22sNYVp41Qgy75U7UebhT3/3ifR2iHzmT3XyYm
	 8CYJwa8p/2nwQjABbTVnfb16a8ORsfMUlHIGx+CxEiUura+UjvoeOf9JprF4IQCfBV+BO
	 N8gKEM2/cB2rFA5VgfKwqSUsIF3HbjmddTFy+ztLkP1+d6kz53DixHunnNeGpygVpGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P1W2BHMe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A45606A333;
	Tue, 24 Nov 2026 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P1W2BHMe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28EA1F000D1;
	Tue, 24 Nov 2026 09:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795513382;
	bh=92i7YAwd0gYdMa4hndWWw/yPBSwh8cVacW1/EyPcRI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P1W2BHMeiB1GUy9M7LQv/at6/lGP3hh8HBk4bvq/Yteif6222oVDKv/ryg31ONkAc
	 +9dE/8BIKaA9PNMvvMCWM08foJOG7mc4t06WOOoPcHKnFR/e3JYiHx+xSQt2NezNbv
	 wKCk4bLMBmmx6qZrwyAEHDO4QczoBl52U58yRWICe0el9Og8KGzpryM9dN6VAPFDZT
	 svgIzGLvp8/cP3BEOG5Ns9d4w9icRZvMyCj9P5JoX7GqGy/hj1409ITnOP9g92TVp/
	 Vz7c7JFeKufW9jkKPLrPeSnN4XF2dEjQTNPOJZnLcvLuk3lIhAWDpX6H82eVF92Wnc
	 ldoVCMR5vG1hw==
Date: Tue, 24 Nov 2026 15:12:59 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/10] soundwire: qcom: Serialise ctrl->intr_mask
 updates
Message-ID: <awVcIyjnZzbK92ge@parshuram>
References: <20261123075522.405347-1-lee@kernel.org>
 <20261123075522.405347-10-lee@kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123075522.405347-10-lee@kernel.org>

Hi Lee,

On 23-11-26, 07:54, Lee Jones wrote:
> qcom_swrm_irq_handler(), swrm_runtime_suspend(), and
> swrm_runtime_resume() concurrently read, modify, and write
> ctrl->intr_mask and program the interrupt enable registers without
> synchronisation.  Overlapping read-modify-write updates can clobber
> interrupt mask bits and leave the hardware interrupt mask out of sync.
> 
> Add ctrl->intr_lock to serialise accesses to ctrl->intr_mask and its
> associated interrupt mask register updates.

Sorry the last two Qcom patches fail as I had picked few of them. I have picked
rest, please rebase these two

-- 
~Vinod
