Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528BE27FD53
	for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 17:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748366822; cv=none; b=YPtPcl/QACJG3UQRfWqIY4OHO9CGvK4M1xWc/Ag3JD12wr3313bjT6QLZAP/FEXuTueQLsT9iSEB9eTQBcZX25gzEnsWevaHWklzM1gXvox3FQn6Kfut/dwCzCaMiv7+41BekokKDC2UDOkCRn3rH/41bUu3VQJgdeu65VGdTfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748366822; c=relaxed/simple;
	bh=1Up8kJfY/bvPKHDKRGL7xFCgxlF7YiHfuqKS2XR4Nqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tjs77qb0vJWFtaL48oDg9XX8ObqVSyjuLxNGhcNxqAv0aIzvt9A4fbN0wIcfZKeGJ96BEwD8Bph09E5qNqi6f3UoSOdhdZK2J51WdMrqrwPdaRqOj0RTzBC1wMUfvc+yNm6hLFfivcdOSHXIl6SUg96SZZ31l9wJFqjOMKNkrQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tbx/5IFi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tbx/5IFi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2F3C4CEE9;
	Tue, 27 May 2025 17:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748366821;
	bh=1Up8kJfY/bvPKHDKRGL7xFCgxlF7YiHfuqKS2XR4Nqo=;
	h=From:To:Cc:Subject:Date:From;
	b=Tbx/5IFiUDZYv81iqPu+LVequkOxoBqw9RPxmgA2AAgnLLSCLYykCOsVqYFvDjAAt
	 iFs910+tiHAC0tfpzCSZ/KPUhZpUtNJtPwcfvyxMHaYjT9uJ6SwMdun9ZrnUUYu/LB
	 t9+cRplRO7ryst+LEBHyRIQeqmbzGKDsiqL+5ECZku8YAP7iPw8nNfW2AI5Fjuxfzx
	 qw9bGQGhqLFXRIaSiHlAQNBLRidfCCWWCYQyYdwIoZdfTERkPvrmRMIKbqABzLZ2Mz
	 Vk+pmCrXGnlAr7cIiwHh7XVjuq4vzlnyupOGCcwygtNAUOAYJsuP5mRw3FrcJ7ufQH
	 FfPsagISE8uuQ==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: [PATCH v3] ALSA: usb-audio: Add a quirk for Lenovo Thinkpad Thunderbolt 3 dock
Date: Tue, 27 May 2025 12:26:56 -0500
Message-ID: <20250527172657.1972565-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

The audio controller in the Lenovo Thinkpad Thunderbolt 3 dock doesn't
support reading the sampling rate.

Add a quirk for it.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3:
 * Sort by other Lenovo VID (Takashi)
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index dbbc9eb935a4b..f302bcebaa9d0 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2284,6 +2284,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
 	DEVICE_FLG(0x17aa, 0x104d, /* Lenovo ThinkStation P620 Internal Speaker + Front Headset */
 		   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
+	DEVICE_FLG(0x17ef, 0x3083, /* Lenovo TBT3 dock */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x1852, 0x5062, /* Luxman D-08u */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x1852, 0x5065, /* Luxman DA-06 */
-- 
2.43.0

