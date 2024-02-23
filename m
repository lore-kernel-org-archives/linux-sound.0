Received: from mail-200166.simplelogin.co (mail-200166.simplelogin.co [176.119.200.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF568F44
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 14:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=176.119.200.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708699336; cv=pass; b=kgaXmL6P4L3SoxBeOXas+n4nZaGR0DCRYGY1x+/IJfDmBJ5hyVQ2tAEcgRnp76cCEo44AoZJcEch/0ogSXM3r+4IQcfTm4O3wPJJt+pzwVloa0WjYpsHYsl123gc/fnIfD2vkGCFyEmvwEy+8yJq64iWpUdzl3FuWn3Rv+t2GX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708699336; c=relaxed/simple;
	bh=fJQJy+9agwrK2lYXTF4aYTDMh/E/eJgm8QM6Y7gCS+s=;
	h=MIME-Version:Date:Subject:Content-Type:From:To:Cc:Message-ID; b=SawGdVCxA2t4vj5wFKZHvLxvFBc2I/GMMSaM3Omz9675A7IVPHm8R6Kgx7YNDa4JxxHTz+hrnnrLo45nhRDrL+dCF8X26mWjrd7KolEPeeg4dNJAFODQF5hVeYEbGfP7Ts0dI4X4W3CSzUx5kN+/TySYBkAVNd8eWNRerfID7QM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=willian.wang; spf=pass smtp.mailfrom=willian.wang; dkim=pass (1024-bit key) header.d=willian.wang header.i=@willian.wang header.b=E68YxpyU; arc=pass smtp.client-ip=176.119.200.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=willian.wang
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=willian.wang
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=willian.wang header.i=@willian.wang header.b="E68YxpyU"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1708699326;
	cv=none; b=0nMPzDPYW4p6JsSyKmFOT/Sop713MEwwovmV7XCuE+XgjYQ4rpaZ/gkysnNMfs/+iXVnLU7QZJ5JQrnlmHxIyFrQZmoWUVhEk1wlH+HPRVCqahOlaSv1/hsDe48Sf/la/lfL39xOAppjg5pG9N+5KHGquQK01rjwbo3et1jZ2Lpq8BRG3zlQ2+yZymjRqusKwVB9Uq3rVQrwTSNvEOzwuKxS/NHXo+6Jj/lmE9zlGtOJyLrApyMcnQEUZnmpgDkW4O3n2qYSGsgZ0Kyq6pN3pRXx+dnbg5FWo7JAzDGhws7dTVwkm449zt4BW5xAj+L4u5Fc/XHIGpdPXnMLVFHcyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1708699326; c=relaxed/simple;
	bh=fJQJy+9agwrK2lYXTF4aYTDMh/E/eJgm8QM6Y7gCS+s=;
	h=Date:Subject:From:To:Cc; b=ZdHwqOskObZe/iB0Z3sHjMewHZ6jMCRWZpeqVWw8JH5/UYVusu7uqdQOwELlXBCpA2UnruX6h3Lw+z2lm5ig16q8A+f1iHKURUa5vyUhhjD++DN3WoSeKgimuajXGVYUkJ9aQRGfT/FnebEmb9wk/5hO3jnBrBDQ+eJUCTaC+/R0XfY0jg6UD4s4TqtkyxwWS9wHAWqP9FGkJDIvWqgdo5Jz+Yhbl3jKR3d5lkJy2sJ6MXiLowoCoAP8KmvGRQL8lz/CmfFn5xX4xesnjrpP/DoB02uVobEHQAzXWXdh0IjtJMpkLrqzDWDB4YOKw0mnkA8zKbSfBlREkYe708AxjQ==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=willian.wang;
	s=dkim; t=1708699326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fJQJy+9agwrK2lYXTF4aYTDMh/E/eJgm8QM6Y7gCS+s=;
	b=E68YxpyUKmZZqju5KM/yWHZRZJrHvNxLPP2196UAzkW487MB2z2eeez/HGFDMAmpKhKXzq
	020APPMZ4okCPRyYE7l5EhV8gHbhDy7uLrOix1baJUwGmCOykOJaiHWrQVs5MW7+CDDcDc
	UC2U1lHvG7ZeTkGX7cTnerqYiVYv8dw=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Feb 2024 11:41:26 -0300
Subject: Re: PCI SSID and Codec SSID collision?
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
From: Willian Wang <kernel@willian.wang>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org,linux-sound@vger.kernel.org,soyer@irl.hu
Message-ID: <170869932581.7.612391552809015627.273152461@willian.wang>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 273152462
X-SimpleLogin-Want-Signing: yes

Hi, I'm curious about the reasons for the fixup table to be the same
for PCI and Codec SSIDs and if the PCI SSID is usually more important
for it to be checked before the Codec. Anyway, would a simple
conditional statement to match these exact PCI and Codec SSID to set
the fixup manually be enough? There seems to already exist a manual
fix for TX300 and ROG Strix G17 there (not the same kind of fix and
with a FIXME comment, though). I have this exact laptop model and
would like to try to contribute to the code if it's not too
complicated.

