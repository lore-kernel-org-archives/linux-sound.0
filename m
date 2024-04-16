Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B080C41C76
	for <linux-sound@vger.kernel.org>; Tue, 16 Apr 2024 12:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713270946; cv=none; b=u0OyZ6IblIl2mvt+zbA3zOSJ6Y0WWS+VkDl+h+RGTWVxHhzO3bjbXb2gjGelF8q9X8gs2GpN48nkP06p9Qb9J57EAngmf6nKHPejfgkTefSp/I4z7hCyA3mVT3sgkhkiX+wCbUyfcEjrTMP0ommErr8idNxPR0EpzdTkJ7v/3MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713270946; c=relaxed/simple;
	bh=eAJMUj6SegpYCtp7Y3WBSjRTzyew0Kix4O4cmieAVrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bx3XSUCyvHrkS92pQlSieaPChgWue144QhFMq2miv641sBECdJmL+m3nmqARo7/24KpGZGyiCuWmygzgLc7/dN6ir3V19qd7jTebqYcI4f2p5E86rMhV8voloFYGxBmJbWzJFMzfsxafEDllRQ8HptfeE9G0KnfhA2l999xlT5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8onMblO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8onMblO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC48C113CE;
	Tue, 16 Apr 2024 12:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713270946;
	bh=eAJMUj6SegpYCtp7Y3WBSjRTzyew0Kix4O4cmieAVrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G8onMblOEVMmNt04Lh7fEuMTj5xH8BuzQ0MPVIjDE1Dvo3N34PWI48tES7hqipV0g
	 81C+mjdYWIF0rDUrIzCDKT3kgXi/WHgMQYZnKmzBQXOZpZuX4TDbQhDNQu504I+Sn6
	 zJbFYBQoNISRWbL+3fGVO1jbAo78O2CqkVlMzp321mg6e1k8banRduTzHtLbOSvJze
	 Ui12qKSp1ipxDCq+joLJhKynLjvzkObvehXKrBJnGzK21CmxtkoCgkfUZiWAi38CJ+
	 EGFIKInYHNFulNkfMPf3bmhiEyHtqRFGqwpJNUpmsLr3zxIeMiG+FKfEhU1dDtFw0v
	 m1Jt+bnV2WvqQ==
Date: Tue, 16 Apr 2024 13:35:41 +0100
From: Lee Jones <lee@kernel.org>
To: James Ogletree <James.Ogletree@cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	"open list:CIRRUS LOGIC HAPTIC DRIVERS" <patches@opensource.cirrus.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>
Subject: Re: [PATCH RESEND v10 5/5] ASoC: cs40l50: Support I2S streaming to
 CS40L50
Message-ID: <20240416123541.GW2399047@google.com>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
 <20240408153214.42368-6-jogletre@opensource.cirrus.com>
 <F09C19F7-F3BC-44A8-B3F8-3064DF8E666F@cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F09C19F7-F3BC-44A8-B3F8-3064DF8E666F@cirrus.com>

On Fri, 12 Apr 2024, James Ogletree wrote:
> All feedback to date has been addressed

There are still MFD review comments left outstanding.

-- 
Lee Jones [李琼斯]
