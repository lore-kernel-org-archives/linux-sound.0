Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04945C4332F
	for <linux-sound@archiver.kernel.org>; Thu,  9 Nov 2023 14:20:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbjKIOUD (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 9 Nov 2023 09:20:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231586AbjKIOUC (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Thu, 9 Nov 2023 09:20:02 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38361D4A
        for <linux-sound@vger.kernel.org>; Thu,  9 Nov 2023 06:20:00 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id DAD451F8B6;
        Thu,  9 Nov 2023 14:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1699539598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=zltiq+7lYTQ/5OGKhAtwa87gh+N4HoIjDwaTB72eVFY=;
        b=hNML6KBVpzsran4koyAfs3VPVa9XeW33piN+0odsi1ZwyGX4zwaeYmCe3juDKiDnuu9hNa
        y1WgUsG45dMoSFLOClm3oYlii3a2EhP6kbl6d+b5XngdQZr03YXrMDpfqw5Iklihy9TXGE
        UoPObUDvRiPQqixEwlEM4/wkILKCpzY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1699539598;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=zltiq+7lYTQ/5OGKhAtwa87gh+N4HoIjDwaTB72eVFY=;
        b=B+cdoID4e15KofeTrfP1l+HIapvPOK+TiOq6zWVcwOkuJGGGFE/UieFugpCrtjLUQckxnI
        hffmAHFTfxc/dWDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B80E4138E5;
        Thu,  9 Nov 2023 14:19:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id /cb7K47qTGVcagAAMHmgww
        (envelope-from <tiwai@suse.de>); Thu, 09 Nov 2023 14:19:58 +0000
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-sound@vger.kernel.org
Cc:     Shinhyung Kang <s47.kang@samsung.com>
Subject: [PATCH] ALSA: info: Fix potential deadlock at disconnection
Date:   Thu,  9 Nov 2023 15:19:54 +0100
Message-Id: <20231109141954.4283-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

As reported recently, ALSA core info helper may cause a deadlock at
the forced device disconnection during the procfs operation.

The proc_remove() (that is called from the snd_card_disconnect()
helper) has a synchronization of the pending procfs accesses via
wait_for_completion().  Meanwhile, ALSA procfs helper takes the global
mutex_lock(&info_mutex) at both the proc_open callback and
snd_card_info_disconnect() helper.  Since the proc_open can't finish
due to the mutex lock, wait_for_completion() never returns, either,
hence it deadlocks.

	TASK#1				TASK#2
	proc_reg_open()
	  takes use_pde()
	snd_info_text_entry_open()
					snd_card_disconnect()
					snd_info_card_disconnect()
					  takes mutex_lock(&info_mutex)
					proc_remove()
					wait_for_completion(unused_pde)
					  ... waiting task#1 closes
	mutex_lock(&info_mutex)
		=> DEADLOCK

This patch is a workaround for avoiding the deadlock scenario above.

The basic strategy is to move proc_remove() call outside the mutex
lock.  proc_remove() can work gracefully without extra locking, and it
can delete the tree recursively alone.  So, we call proc_remove() at
snd_info_card_disconnection() at first, then delete the rest resources
recursively within the info_mutex lock.

After the change, the function snd_info_disconnect() doesn't do
disconnection by itself any longer, but it merely clears the procfs
pointer.  So rename the function to snd_info_clear_entries() for
avoiding confusion.

The similar change is applied to snd_info_free_entry(), too.  Since
the proc_remove() is called only conditionally with the non-NULL
entry->p, it's skipped after the snd_info_clear_entries() call.

Reported-by: Shinhyung Kang <s47.kang@samsung.com>
Closes: https://lore.kernel.org/r/664457955.21699345385931.JavaMail.epsvc@epcpadp4
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/info.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/core/info.c b/sound/core/info.c
index 0b2f04dcb589..e2f302e55bbb 100644
--- a/sound/core/info.c
+++ b/sound/core/info.c
@@ -56,7 +56,7 @@ struct snd_info_private_data {
 };
 
 static int snd_info_version_init(void);
-static void snd_info_disconnect(struct snd_info_entry *entry);
+static void snd_info_clear_entries(struct snd_info_entry *entry);
 
 /*
 
@@ -569,11 +569,16 @@ void snd_info_card_disconnect(struct snd_card *card)
 {
 	if (!card)
 		return;
-	mutex_lock(&info_mutex);
+
 	proc_remove(card->proc_root_link);
-	card->proc_root_link = NULL;
 	if (card->proc_root)
-		snd_info_disconnect(card->proc_root);
+		proc_remove(card->proc_root->p);
+
+	mutex_lock(&info_mutex);
+	if (card->proc_root)
+		snd_info_clear_entries(card->proc_root);
+	card->proc_root_link = NULL;
+	card->proc_root = NULL;
 	mutex_unlock(&info_mutex);
 }
 
@@ -745,15 +750,14 @@ struct snd_info_entry *snd_info_create_card_entry(struct snd_card *card,
 }
 EXPORT_SYMBOL(snd_info_create_card_entry);
 
-static void snd_info_disconnect(struct snd_info_entry *entry)
+static void snd_info_clear_entries(struct snd_info_entry *entry)
 {
 	struct snd_info_entry *p;
 
 	if (!entry->p)
 		return;
 	list_for_each_entry(p, &entry->children, list)
-		snd_info_disconnect(p);
-	proc_remove(entry->p);
+		snd_info_clear_entries(p);
 	entry->p = NULL;
 }
 
@@ -770,8 +774,9 @@ void snd_info_free_entry(struct snd_info_entry * entry)
 	if (!entry)
 		return;
 	if (entry->p) {
+		proc_remove(entry->p);
 		mutex_lock(&info_mutex);
-		snd_info_disconnect(entry);
+		snd_info_clear_entries(entry);
 		mutex_unlock(&info_mutex);
 	}
 
-- 
2.35.3

