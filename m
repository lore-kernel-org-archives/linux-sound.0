Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC09341A57E;
	Thu,  6 Aug 2026 08:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005580; cv=none; b=RaBb2dhhuAiKT900ugQKq7eUDFChpDavQ3uOzuqEuVWRdJZPza/96dKjm5AAO9qelTiHkuSQQDUiJPVok9H8LIS+qgJ5RlaSe1/+xqil4c2Aq+RA9tStkEhHfUz/IKzr5OkRyWq8LboNhY3qLicSlkmFeZ3QIPYSbNAjQbdJSbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005580; c=relaxed/simple;
	bh=doAUZf0MRIWUnmQ2+FAG7eRdE/Ue5t13YxLN7pU0ZvU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iwyMr9Jf3QZ91hQQJl/3RtAND1uh3JFcDKQRizSjRaozFrs6Xw7udpOjZt5ROC5uZjp//UZVpnOsOb6BoJlCEoZqQu51hDvnZCaCFwqrkW0LpDPka8yyOGK8Kc6FUWSlMikQ5w3oMfvrFyKZPYAhQHEuWxLp4f/T0Toh4oMv7cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U28sG+AW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U28sG+AW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E111F00A3A;
	Thu,  6 Aug 2026 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786005563;
	bh=8YenIHzBl7aLDTLtEUL+XD57PYiavEvu25JNyX+w+VY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=U28sG+AWrxUnrq9GFQRYFbNQmF9t6LdUeA+7bAWgpZmqDU5bKNJsQIR036JWfv2vr
	 dBgJuPPxfW43eqXUMwHlpAkySzm9U+cFuclIgMb71mreH9lV0s+dJqvezCWN+MDCVI
	 IzWExCIgBQ1WsFvYz/oGov4tSZywD4PH5wIfa+eYxeLsc6c5QZgKXRHrXxODwpeIaX
	 S76sNwwEOrjd3JfNOoMvqJRr2awDKhtWwModscsg1/YOMqxsa6ewYQ36vSf/MyEtgT
	 maJSR72IDjtSuH7DdNn73bi3HdjwM59wx9rmEXDmX2Zx2RHpPi9hgENsHtIB/pZQeE
	 BOFE+Iic8GV5A==
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260720095741.3592825-1-ckeepax@opensource.cirrus.com>
References: <20260720095741.3592825-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: dmi-quirks: Disable ghost Realtek on Asus
 Zenbook Duo
Message-Id: <178600556126.593040.10526120800240530108.b4-ty@kernel.org>
Date: Thu, 06 Aug 2026 14:09:21 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 20 Jul 2026 10:57:41 +0100, Charles Keepax wrote:
> The Asus Zenbook Duo also has a Realtek device in the ACPI that
> doesn't exist in the physical hardware. This confuses the machine
> driver into attempting to create DAI links for the device. Add a
> quirk to remove this device.
> 
> 

Applied, thanks!

[1/1] soundwire: dmi-quirks: Disable ghost Realtek on Asus Zenbook Duo
      commit: ca02ffd4975ca5249abf0cfb750a495d23b453ee

Best regards,
-- 
~Vinod


