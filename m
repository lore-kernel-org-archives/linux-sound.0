Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4B41AC44D;
	Thu,  5 Feb 2026 00:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770251160; cv=none; b=IopDHHxeqcV6JEW0PRUOMsML5SWKSo/65k0dbXb/SYsm1M4OVOxkJbCrGxc1wX7FWKaDukrnp2Ncg/axvkLZXqw2mwYpoKYnUbH8p+EEZbaaJQrnO2VjXuQHKThfTpqVjqUXg5Jml5oc4qUFmBulZoAsAWGRIzpnYg9mDcJ8JIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770251160; c=relaxed/simple;
	bh=A1qvoWRDf+EZQ1yuUvvB/bd/reDvUJRHMP7dPF04ZqA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mNoXNroBs+9huT4ER/teMphD+L5ByiXUcHG8WsW1VyE66H+kVA7SLw/Yru0UVOC1IHpQ5DWj2K1x5yk7rC+BrRI97o324ldEeFGWyX4J3v5xwVmw1h6pIIxi+jzaJ3aGWrd7DxKEMXuuBaBUlADksuc9Uuj+KGBnhzwBetCBCns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlLKZhRX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlLKZhRX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F436C4CEF7;
	Thu,  5 Feb 2026 00:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770251160;
	bh=A1qvoWRDf+EZQ1yuUvvB/bd/reDvUJRHMP7dPF04ZqA=;
	h=From:Subject:Date:To:Cc:From;
	b=dlLKZhRXwfTCeXswclzS3QqbOAr2rOEGKXmw9Pt6a7o7idWy5q9YiWs1qUbKXzjZD
	 TKlPpwg7KzLWN2/IYDu9yr6hVWGemqqflYgclxQMZRyhBsTeZP7NwBwYwCPSBmX3vW
	 5bbuH04zk6l/6y8VOcpnSnE09B+xsx66y2rgISijfNEvac6RgRyHe9JlgJ3CbsDnJX
	 rofxRB3llHp1ypewXPnFZPgVB1qg2qEeFlfhA88mKrQMTa8/Lmwz8hwpN3Tm53npOr
	 w4dbNiUFj5vi08KumvDm1fnYOVnWqRWqPXw1WS5urnU0wM2QMEkxpe795uR5jgm24k
	 4ehr8/lTV0Jnw==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: fsl_easrc: Fix control writes
Date: Thu, 05 Feb 2026 00:25:36 +0000
Message-Id: <20260205-asoc-fsl-easrc-fix-events-v1-0-39d4c766918b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIDjg2kC/yWM0QqCQBBFf0XmuYF1ULF+JXpYt2tNxBo7KoH47
 031dg+XczYyFIXRqdqoYFXTKTvUh4rSPeYbWK/OJEG6IKHhaFPi0Z6MaMWXvhkr8mxcj7000vb
 tcejI/VeBv7/2+fJnW4YH0vwN0r5/AKq2rgB9AAAA
X-Change-ID: 20260204-asoc-fsl-easrc-fix-events-1f82425859b6
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=645; i=broonie@kernel.org;
 h=from:subject:message-id; bh=A1qvoWRDf+EZQ1yuUvvB/bd/reDvUJRHMP7dPF04ZqA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpg+OT0250YidbTc5jjN5sLgvJbg2YrgehKcdiW
 J41g94V6JGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaYPjkwAKCRAk1otyXVSH
 0B8wB/9XkeHc9cIJeUMlZgOBcxZoVBZTJ60U1ZQOgswVQzB0cEntN2DhdQf+uMvBjycv23nQNnQ
 kvaImY6VShdtOgCpI6YnbDRZwPQPyBogwhuOcNIbpmxWywv9ryMUsaPBPK02UFdcYndoxza6WgV
 KiXo8tGXER1kDeCJrmZEW4zBk97sOXt6k/X7c7WLjTCnnBj0DtmXXWC/kaQFxxjKnP2e7H9iYeZ
 Q9SPt/vt9nIO+R29mGeSU+JHMfoKOtXDnKQ99q3WoHBLzbZdbdWISCtNDDPVl32zBYxx/9lkaRs
 o3qD8mlkn7Jzabc1P85XoRQUY/yO1tBVuadWj8nPZZ3H2HiN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

I noticed that neither of the put() operations for the controls defined
by the fsl_easrc driver was flagging value changes properly, fix that.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_put_bits()
      ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_set_reg()

 sound/soc/fsl/fsl_easrc.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260204-asoc-fsl-easrc-fix-events-1f82425859b6

Best regards,
--  
Mark Brown <broonie@kernel.org>

