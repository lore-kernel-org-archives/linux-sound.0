Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DCB1EB4AB
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037670; cv=none; b=KjqeEhO9/Ibrna8vW95piMxxaFdNJZsqysMV4SpvaJcaXxhm7VMNFET8rl/fBWuMR/Ovtn4rXAMOl+lBXLwaVbJcvR84s9c4Aw9Pxf0NDO1k4QnMV4dW8oTCMeG50d/iCBwlhX7j8zGWCzGSS6OSvOM+MzBE+AFnREHuUZf2aFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037670; c=relaxed/simple;
	bh=xiGjQONY14z9170L+2tfy2UaAOAOjyUkThzn5bIvSfs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSH5f1RWD0GF7l36ZidTj6WcF+hx2V+kz9FNoRrotN0WaS3E71YHoBhXKVOq5y7wadsy+CiR/o949NCv3AaUGBQTIXNUul9q670noR3vcCxSrepcYSsYr0rPc/k0bGdhaDMBkgajxj/lF1/ytSj/JFOeNs55jdW3Q1+LfQRUm/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YhzcnmTO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0p/YYcUL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a9aaPaMR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JfG/rh7+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YhzcnmTO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0p/YYcUL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a9aaPaMR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JfG/rh7+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CE59C1FDD6;
	Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2rijWf9vovKeETkwOdja7yvhj2uEmjV2WVVbIxqFSg=;
	b=YhzcnmTOtSq1NB3Gs4zvyAJ/zlWqaprpKG+Yi2katqfJAV4ynPMVvoEVhHhhVY8yQI53Rz
	4iNJJTtLCTGATbYvz8LDvmX1o8atMARhT+fW9b15Je8rjPm06pFpj79MQq8muy61Qn5+au
	r3Mx6du5xOJ8HCAVnUv8JqLXB3tiH6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037664;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2rijWf9vovKeETkwOdja7yvhj2uEmjV2WVVbIxqFSg=;
	b=0p/YYcULoN/MK9Jk5FuzdV6FXTC330EoDnjEfF3kgRiaoeJigb3EkxqkZPun281pa7W5Ym
	RaygszO3sPsoQdCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=a9aaPaMR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="JfG/rh7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2rijWf9vovKeETkwOdja7yvhj2uEmjV2WVVbIxqFSg=;
	b=a9aaPaMRtETg7/DUL577C4yAa7Dsa6xksgQkR6HxhtztqD2JbTnqJkxXX8DJLeDZPzy2CP
	IowhRbiRG0vRaoLqQBIc3nQwg1SExId4oOcYbDY2WCXPGEIt4m+f8w9tBG5q1/AHTa6FxX
	gB2r0tKNKOXUb4MWYvoeSeMVBklAKoQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2rijWf9vovKeETkwOdja7yvhj2uEmjV2WVVbIxqFSg=;
	b=JfG/rh7+0FBdmP9djFNpvAKkV0aRK+OAjo8oD1N+ajkECIeCTeogRPfiTnH6ulAlOgEWE3
	kutAc+sp2uWEaDAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B702D13B05;
	Wed,  7 Aug 2024 13:34:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GPohK993s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 54/54] ALSA: core: Drop snd_print stuff and co
Date: Wed,  7 Aug 2024 15:34:44 +0200
Message-ID: <20240807133452.9424-55-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
X-Rspamd-Queue-Id: CE59C1FDD6
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

Now that all users of snd_print*() are gone, let's drop the functions
completely.  This also makes CONFIG_SND_VERBOSE_PRINTK redundant, and
it's dropped, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/core.h | 67 -----------------------------------------
 sound/core/Kconfig   |  9 ------
 sound/core/misc.c    | 71 --------------------------------------------
 3 files changed, 147 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index dfef0c9d4b9f..23401aaf3dc2 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -345,45 +345,7 @@ void release_and_free_resource(struct resource *res);
 
 /* --- */
 
-/* sound printk debug levels */
-enum {
-	SND_PR_ALWAYS,
-	SND_PR_DEBUG,
-	SND_PR_VERBOSE,
-};
-
-#if defined(CONFIG_SND_DEBUG) || defined(CONFIG_SND_VERBOSE_PRINTK)
-__printf(4, 5)
-void __snd_printk(unsigned int level, const char *file, int line,
-		  const char *format, ...);
-#else
-#define __snd_printk(level, file, line, format, ...) \
-	printk(format, ##__VA_ARGS__)
-#endif
-
-/**
- * snd_printk - printk wrapper
- * @fmt: format string
- *
- * Works like printk() but prints the file and the line of the caller
- * when configured with CONFIG_SND_VERBOSE_PRINTK.
- */
-#define snd_printk(fmt, ...) \
-	__snd_printk(0, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
-
 #ifdef CONFIG_SND_DEBUG
-/**
- * snd_printd - debug printk
- * @fmt: format string
- *
- * Works like snd_printk() for debugging purposes.
- * Ignored when CONFIG_SND_DEBUG is not set.
- */
-#define snd_printd(fmt, ...) \
-	__snd_printk(1, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
-#define _snd_printd(level, fmt, ...) \
-	__snd_printk(level, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
-
 /**
  * snd_BUG - give a BUG warning message and stack trace
  *
@@ -392,12 +354,6 @@ void __snd_printk(unsigned int level, const char *file, int line,
  */
 #define snd_BUG()		WARN(1, "BUG?\n")
 
-/**
- * snd_printd_ratelimit - Suppress high rates of output when
- * 			  CONFIG_SND_DEBUG is enabled.
- */
-#define snd_printd_ratelimit() printk_ratelimit()
-
 /**
  * snd_BUG_ON - debugging check macro
  * @cond: condition to evaluate
@@ -409,11 +365,6 @@ void __snd_printk(unsigned int level, const char *file, int line,
 
 #else /* !CONFIG_SND_DEBUG */
 
-__printf(1, 2)
-static inline void snd_printd(const char *format, ...) {}
-__printf(2, 3)
-static inline void _snd_printd(int level, const char *format, ...) {}
-
 #define snd_BUG()			do { } while (0)
 
 #define snd_BUG_ON(condition) ({ \
@@ -421,26 +372,8 @@ static inline void _snd_printd(int level, const char *format, ...) {}
 	unlikely(__ret_warn_on); \
 })
 
-static inline bool snd_printd_ratelimit(void) { return false; }
-
 #endif /* CONFIG_SND_DEBUG */
 
-#ifdef CONFIG_SND_DEBUG_VERBOSE
-/**
- * snd_printdd - debug printk
- * @format: format string
- *
- * Works like snd_printk() for debugging purposes.
- * Ignored when CONFIG_SND_DEBUG_VERBOSE is not set.
- */
-#define snd_printdd(format, ...) \
-	__snd_printk(2, __FILE__, __LINE__, format, ##__VA_ARGS__)
-#else
-__printf(1, 2)
-static inline void snd_printdd(const char *format, ...) {}
-#endif
-
-
 #define SNDRV_OSS_VERSION         ((3<<16)|(8<<8)|(1<<4)|(0))	/* 3.8.1a */
 
 /* for easier backward-porting */
diff --git a/sound/core/Kconfig b/sound/core/Kconfig
index b970a1734647..f0ba87d4e504 100644
--- a/sound/core/Kconfig
+++ b/sound/core/Kconfig
@@ -175,15 +175,6 @@ config SND_VERBOSE_PROCFS
 	  useful information to developers when a problem occurs).  On the
 	  other side, it makes the ALSA subsystem larger.
 
-config SND_VERBOSE_PRINTK
-	bool "Verbose printk"
-	help
-	  Say Y here to enable verbose log messages.  These messages
-	  will help to identify source file and position containing
-	  printed messages.
-
-	  You don't need this unless you're debugging ALSA.
-
 config SND_CTL_FAST_LOOKUP
 	bool "Fast lookup of control elements" if EXPERT
 	default y
diff --git a/sound/core/misc.c b/sound/core/misc.c
index d32a19976a2b..c2fda3bd90a0 100644
--- a/sound/core/misc.c
+++ b/sound/core/misc.c
@@ -13,20 +13,6 @@
 #include <linux/fs.h>
 #include <sound/core.h>
 
-#ifdef CONFIG_SND_DEBUG
-
-#ifdef CONFIG_SND_DEBUG_VERBOSE
-#define DEFAULT_DEBUG_LEVEL	2
-#else
-#define DEFAULT_DEBUG_LEVEL	1
-#endif
-
-static int debug = DEFAULT_DEBUG_LEVEL;
-module_param(debug, int, 0644);
-MODULE_PARM_DESC(debug, "Debug level (0 = disable)");
-
-#endif /* CONFIG_SND_DEBUG */
-
 void release_and_free_resource(struct resource *res)
 {
 	if (res) {
@@ -36,63 +22,6 @@ void release_and_free_resource(struct resource *res)
 }
 EXPORT_SYMBOL(release_and_free_resource);
 
-#ifdef CONFIG_SND_VERBOSE_PRINTK
-/* strip the leading path if the given path is absolute */
-static const char *sanity_file_name(const char *path)
-{
-	if (*path == '/')
-		return strrchr(path, '/') + 1;
-	else
-		return path;
-}
-#endif
-
-#if defined(CONFIG_SND_DEBUG) || defined(CONFIG_SND_VERBOSE_PRINTK)
-void __snd_printk(unsigned int level, const char *path, int line,
-		  const char *format, ...)
-{
-	va_list args;
-#ifdef CONFIG_SND_VERBOSE_PRINTK
-	int kern_level;
-	struct va_format vaf;
-	char verbose_fmt[] = KERN_DEFAULT "ALSA %s:%d %pV";
-	bool level_found = false;
-#endif
-
-#ifdef CONFIG_SND_DEBUG
-	if (debug < level)
-		return;
-#endif
-
-	va_start(args, format);
-#ifdef CONFIG_SND_VERBOSE_PRINTK
-	vaf.fmt = format;
-	vaf.va = &args;
-
-	while ((kern_level = printk_get_level(vaf.fmt)) != 0) {
-		const char *end_of_header = printk_skip_level(vaf.fmt);
-
-		/* Ignore KERN_CONT. We print filename:line for each piece. */
-		if (kern_level >= '0' && kern_level <= '7') {
-			memcpy(verbose_fmt, vaf.fmt, end_of_header - vaf.fmt);
-			level_found = true;
-		}
-
-		vaf.fmt = end_of_header;
-	}
-
-	if (!level_found && level)
-		memcpy(verbose_fmt, KERN_DEBUG, sizeof(KERN_DEBUG) - 1);
-
-	printk(verbose_fmt, sanity_file_name(path), line, &vaf);
-#else
-	vprintk(format, args);
-#endif
-	va_end(args);
-}
-EXPORT_SYMBOL_GPL(__snd_printk);
-#endif
-
 #ifdef CONFIG_PCI
 #include <linux/pci.h>
 /**
-- 
2.43.0

