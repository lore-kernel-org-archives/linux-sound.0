Received: from cse.ust.hk (cssvr7.cse.ust.hk [143.89.41.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D50C31F983;
	Tue, 28 Apr 2026 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=143.89.41.157
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363337; cv=pass; b=lGIDJ6K0H2+zjNnCSjIio6vtkX68yQOX9P576ublcfSLHV1/CBPz5D7xYQi1tR6OeGS/6DY7dHccbSYCNQVab0a6Yq4Er52pUP+4sLOtVumU5DkriEUNjlWoK0CyBzktIXKx8dFIVhJR1z3tWK1jnub7JzicyPFbBv0Wwn9WIn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363337; c=relaxed/simple;
	bh=S4OK4VJXIp+ahOJ0u5h6kGrmq5MpZTmwflllWODfUmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHbifklaq15MkX+k4PNkNfXJWypqRN4aZWIxFuDU9k50WEASRcetou/lI4SuHEB8O7z8mmFtRlaldPRp74Q+q2DyQ7J4xCM37kROgHON6gerzQuOu1rv3+L6X4piCT+kE4AD+eAvP+KAaZdg1VTAyFV1b89wQda57W5c6LlwB+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.ust.hk; spf=pass smtp.mailfrom=cse.ust.hk; dkim=pass (1024-bit key) header.d=cse.ust.hk header.i=@cse.ust.hk header.b=29JuEtIH; arc=pass smtp.client-ip=143.89.41.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.ust.hk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.ust.hk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cse.ust.hk header.i=@cse.ust.hk header.b="29JuEtIH"
ARC-Seal: i=1; d=cse.ust.hk; s=arccse; a=rsa-sha256; cv=none; t=1777363311;
	b=tdzS0f11clOe/0WxeBMZp1DAIqZMjKAzsxerDecRntp8/aj6BStbvv7qO5WqOazY81SM
	 u/dORc/i0FLMMUjo08JNRRwbYbGu6DmbxFikk0/7z3PQh/5UCi6s87udUA629SVg7Je5u
	 950hyFii5gqxihDMGVGptGxl66CqqcuM3A=
ARC-Message-Signature: i=1; d=cse.ust.hk; s=arccse; a=rsa-sha256;
	c=relaxed/relaxed; t=1777363311;
	h=DKIM-Signature:Date:From:To:Subject:Message-ID:MIME-Version;
	bh=dxpV12JY3UaIwaqnfCAHvl4Z3rUyodEpctJOMdNdIPU=;
	b=uYOqjcM8pUl33LrdT1ZmYAx+x7cDPHg8qD0BzkZisMeKcPzM0tpk4TibZJlTlEIfhf/V
	 6H5CCiHr0QRZJOlBXCAj12a+52hCSoaB7PKl/ius5LNTr+znjlyCOBlZiQ9xpS+OiTnmB
	 U/EcWh7tI70SO4AJB07kFHr2ARNZszBhr8=
ARC-Authentication-Results: i=1; cse.ust.hk; arc=none smtp.remote-ip=143.89.191.45
Received: from chcpu16 (191host045.mobilenet.cse.ust.hk [143.89.191.45])
	(authenticated bits=0)
	by cse.ust.hk (8.18.1/8.12.5) with ESMTPSA id 63S81i0D3244876
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Apr 2026 16:01:49 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cse.ust.hk;
	s=cseusthk; t=1777363311;
	bh=dxpV12JY3UaIwaqnfCAHvl4Z3rUyodEpctJOMdNdIPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=29JuEtIHdp+ZgXRN6Ewicv5u4THnjZG/ctt7nvhYTtFyMwyni2Oes2al3u8A5KvTD
	 M9oUS9yAGg4J8lBhBIZMHYsT0abkoI0vMS/PDoLiiYuzMCaMssAigVzdNa/3RHnTtn
	 rGeF5Wt6uYl5DNqij7QYu1lOHaNJHA1ix3Qj653o=
Date: Tue, 28 Apr 2026 16:01:39 +0800
From: Shuhao Fu <sfual@cse.ust.hk>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: hda: cs35l56: Put ACPI device after setting
 companion
Message-ID: <20260428080139.GA1649104@chcpu16>
References: <20260428074415.GA1632446@chcpu16>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428074415.GA1632446@chcpu16>
X-Env-From: sfual

acpi_dev_get_first_match_dev() returns a refcounted ACPI device and
callers are expected to balance it with acpi_dev_put().

When no companion is already attached, cs35l56_hda_read_acpi() looks
up an ACPI device and sets it with ACPI_COMPANION_SET(), but leaves
the lookup reference held.

ACPI_COMPANION_SET() does not take ownership of that reference, so
drop it with acpi_dev_put() after attaching the companion.

Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
---
 sound/hda/codecs/side-codecs/cs35l56_hda.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda.c b/sound/hda/codecs/side-codecs/cs35l56_hda.c
index 1ace4beef50857b..16a5a40899b2873 100644
--- a/sound/hda/codecs/side-codecs/cs35l56_hda.c
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda.c
@@ -1032,6 +1032,7 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int hid, int id)
 			return -ENODEV;
 		}
 		ACPI_COMPANION_SET(cs35l56->base.dev, adev);
+		acpi_dev_put(adev);
 	}
 
 	/* Initialize things that could be overwritten by a fixup */
